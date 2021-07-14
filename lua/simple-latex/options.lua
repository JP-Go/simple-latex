local vars = vim.g
local userVars = {
    engines = vars.simple_latex_engines, 
    default_mappings = vars.simple_latex_default_mappings,
    viewer = vars.simple_latex_viewer,
    synctex = vars.simple_latex_synctex,
    compile_options = vars.simple_latex_compile_options
}

M = {
    default_mappings = true,
    engines = userVars.engines or {'pdflatex','xelatex','lualatex'},
    viewer = userVars.viewer or 'xdg-open',
    synctex = userVars.synctex or false,
    compile_options = userVars.compile_options or false,
}

M.mergeOptions = function(new)
    if new then
        M.default_mappings = M.default_mappings and (new.default_mappings or userVars.default_mappings) 
        M.engines = new.engines or M.engines
        M.viewer = new.viewer or M.viewer
        M.synctex = new.synctex or M.synctex
        M.compile_options = new.compile_options or M.compile_options
    end
end

return M
