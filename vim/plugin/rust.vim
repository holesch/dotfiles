if !exists("current_compiler") && filereadable('Cargo.toml')
    compiler! cargo
endif
