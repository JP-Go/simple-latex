local vars = vim.g
local M = {}
local userVars = {
    engines = vars.simple_latex_engines, 
    default_mappings = vars.simple_latex_default_mappings,
    viewer = vars.simple_latex_viewer,
    synctex = vars.simple_latex_synctex,
    compile_options = vars.simple_latex_compile_options
}

M.opts = {
    default_mappings = true,
    engines = userVars.engines or {'pdflatex','xelatex','lualatex'},
    viewer = userVars.viewer or 'xdg-open',
    synctex = userVars.synctex or false,
    compile_options = userVars.compile_options or false,
}
M.mergeOptions = function(new)
    if new then
        M.opts.default_mappings = M.default_mappings and (new.default_mappings or userVars.default_mappings) 
        M.opts.engines = new.engines or M.opts.engines
        M.opts.viewer = new.viewer or M.opts.viewer
        M.opts.synctex = new.synctex or M.opts.synctex
        M.opts.compile_options = options.compile_options or M.opts.compile_options
    end
end

return M
