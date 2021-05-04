vim.g.simple_latex_default_mappings = true

if (vim.g.simple_latex_engines ==  nil) then
	vim.g.simple_latex_engines = {"pdflatex"}
end
if (vim.g.simple_latex_default_mappings ~= false or vim.g.simple_latex_default_mappings == nil) then
	require('simple-latex.keymaps')
end
require('simple-latex.commands')
