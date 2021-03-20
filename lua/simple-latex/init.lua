vim.g.simple_latex_default_mappings = true
vim.g.simple_latex_viewer = "zathura"
vim.g.simple_latex_enines = {"pdflatex","xelatex","lualatex"}
if (vim.g.simple_latex_default_mappings and true) then
	require('simple-latex.keymaps')
end
require('simple-latex.commands')
