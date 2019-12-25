import pathlib

def prompt(current):
    """GDB prompt

    Return a colored prompt with the format:
    debugged_program @ current_function >
    """
    filename = gdb.selected_inferior().progspace.filename
    if filename:
        prog_name = pathlib.Path(filename).name
        try:
            frame = gdb.selected_frame()
            function = frame.function()
            location = " \033[1;39m@\033[1;32m "
            if function:
                location += function.print_name
            else:
                location += "0x{:016x}".format(frame.pc())
        except gdb.error:
            location = ""
    else:
        prog_name = "gdb"
        location = ""

    return '\033[1;32m{}{} \033[1;31m>\033[0m '.format(prog_name, location)

gdb.prompt_hook = prompt
