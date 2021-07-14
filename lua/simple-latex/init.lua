local M = {}

-- vim.g.simple_latex_default_mappings = true
-- 
-- if (vim.g.simple_latex_engines ==  nil) then
-- 	vim.g.simple_latex_engines = {"pdflatex"}
-- end
-- if (vim.g.simple_latex_default_mappings ~= false or vim.g.simple_latex_default_mappings == nil) then
-- 	require('simple-latex.keymaps')
-- end
-- require('simple-latex.commands')

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
