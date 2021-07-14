local M = {}

local userVars = {engines = vim.g.simple_latex_engines, default_mappings = vim.g.simple_latex_default_mappings}

M.default_mappings = true
M.engines = userVars.engines or {'pdflatex','xelatex','lualatex'}
M.setup = function(options)
    local options = options or false
    if options then
        M.default_mappings = M.default_mappings and (options.default_mappings or userVars.default_mappings) 
        M.engines = options.engines or M.engines
    end

    if M.default_mappings then
        require('simple-latex.keymaps')
    end
    require('simple-latex.commands')
end

return M
