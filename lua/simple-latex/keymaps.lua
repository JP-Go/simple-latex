local keymap = require('latex.utils').createKeymap
local opts = {noremap = true}
keymap('n','<space>cp','<cmd> CompileLatex pdflatex<CR>',opts)
keymap('n','<space>cx','<cmd> CompileLatex xelatex<CR>',opts)
keymap('n','<space>cl','<cmd> CompileLatex lualatex<CR>',opts)
keymap('n','<space>pp','<cmd> OpenPdf<CR>',{noremap =  true,silent = true})
