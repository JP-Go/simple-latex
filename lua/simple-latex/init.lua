vim.g.simple_latex_default_mappings = true

if (vim.g.simple_latex_engines ==  nil) then
	vim.g.simple_latex_engines = {"pdflatex"}
end
if (vim.g.simple_latex_default_mappings) then
	require('simple-latex.keymaps')
end
require('simple-latex.commands')
