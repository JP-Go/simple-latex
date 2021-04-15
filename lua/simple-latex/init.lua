vim.g.simple_latex_default_mappings = true

if (vim.g.simple_latex_default_mappings) then
	require('simple-latex.keymaps')
end
require('simple-latex.commands')
