vim.g.simple_latex_default_mappings = true

if (table.maxn(vim.g.simple_latex_engines) == 0) then
	vim.g.simple_latex_engines = {"pdflatex","xelatex","lualatex"}
end
if (table.maxn(vim.g.simple_latex_viewer) == 0) then
	vim.g.simple_latex_viewers = "xdg-open"
end
if (vim.g.simple_latex_default_mappings) then
	require('simple-latex.keymaps')
end
require('simple-latex.commands')
