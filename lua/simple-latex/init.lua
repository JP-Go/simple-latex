vim.g.simple_latex_default_mappings = true

if (vim.g.simple_latex_engines == "") then
	vim.g.simple_latex_engines = {"pdflatex","xelatex","lualatex"}
end
if (vim.g.simple_latex_viewer == "") then
	vim.g.simple_latex_viewers = "xdg-open"
end
if (vim.g.simple_latex_default_mappings) then
	require('simple-latex.keymaps')
end
require('simple-latex.commands')
