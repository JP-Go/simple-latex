local M = {}

M.default_mappings = vim.g.simple_latex_default_mappings or true
M.engines = vim.g.simple_latex_engines or {'pdflatex'}
M.setup = function(options)
    local options = options or nil
    if options then
        M.default_mappings = options.default_mappings or M.default_mappings 
        M.engines = options.engines or M.engines
    end

    require('simple-latex.commands')
    if M.default_mappings then
        require('simple-latex.keymaps')
    end
end

return M
