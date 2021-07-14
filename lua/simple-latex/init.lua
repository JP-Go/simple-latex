local M = {}

M.default_mappings = vim.g.simple_latex_default_mappings and true
M.engines = vim.g.simple_latex_engines or {'pdflatex','xelatex','lualatex'}
M.setup = function(options)
    local options = options or false
    if options then
        M.default_mappings = options.default_mappings and M.default_mappings 
        M.engines = options.engines or M.engines
    end

    if M.default_mappings then
        require('simple-latex.keymaps')
    end
    require('simple-latex.commands')
end
print(M.default_mappings)

return M
