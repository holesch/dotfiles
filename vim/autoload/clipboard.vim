let s:type_path = $HOME . '/.cache/vim/regtype'
let s:clipboard_time = 0

function! clipboard#save(reginfo) abort
    " Only save when copied into the default register
    if !empty(a:reginfo["regname"])
        return
    endif

    let type = a:reginfo["regtype"]
    if type ==# "V"
        " When the content is copied linewise (e.g. yy), Vim doesn't include a
        " trailing new line. Add it here, so external programs paste
        " correctly, remove it again in clipboard#paste().
        let contents = a:reginfo["regcontents"] + [""]
    else
        let contents = a:reginfo["regcontents"]
    endif

    call s:save(type, contents)
endfunction

function! clipboard#save_str(string) abort
    call setreg(v:register, a:string)

    if v:register ==# '"'
        call s:save("v", [a:string])
    endif
endfunction

function! s:save(type, contents) abort
    " Passing the content as {input} with system() removes the trailing new
    " line, so write it into a tmpfile and read it from there.
    let tmpfile = tempname()
    call writefile(a:contents, tmpfile, "b")
    " The -w option was added in tmux 3.2: also sets the system clipboard
    " using an xterm escape sequence.
    silent call system("tmux load-buffer -w " . tmpfile)
    call delete(tmpfile)

    " share the regtype in a separate file
    call writefile([a:type], s:type_path, "b")

    " save the timestamp to avoid loading the clipboard unnecessarily
    let s:clipboard_time = localtime()
endfunction

function! clipboard#paste(how) abort
    " Only load when pasting from the default register
    if v:register !=# '"'
        return '"' . v:register . a:how
    endif

    " Only load when the clipboard was updated externally
    let ftime = getftime(s:type_path)
    if ftime != -1 && ftime <= s:clipboard_time
        return a:how
    endif

    " The system() call messes with new lines in stdout, so to load even
    " binary contents correctly, save it to a tmpfile and read it from there.
    let tmpfile = tempname()
    silent call system("tmux save-buffer " . tmpfile)
    let contents = readfile(tmpfile, "b")
    call delete(tmpfile)

    if getfsize(s:type_path) > 0
        " clipboard was saved by another Vim instance, import the regtype
        let type = readfile(s:type_path, "b")[0]
    else
        " Clibpoard wasn't saved by another Vim instance, infer the regtype
        " from the contents: Paste linewise if contents end in a new line,
        " otherwise paste characterwise. An empty trailing list item means a
        " trailing new line, see :h readfile().
        if empty(contents[-1])
            let type = "V"
        else
            let type = "v"
        endif
        " Save the type to update the timestamp, so the clipboard doesn't have
        " to be loaded again.
        call writefile([type], s:type_path, "b")
    endif

    if type ==# "V"
        " remove added trailing new line (see clipboard#save())
        let contents = contents[:-2]
    endif

    " set the default register contents
    call setreg("", contents, type)

    " save the timestamp to avoid loading the clipboard unnecessarily
    let s:clipboard_time = localtime()

    return a:how
endfunction
