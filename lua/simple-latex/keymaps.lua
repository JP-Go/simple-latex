local keymap = require('simple-latex.utils').createKeymap
local opts = {noremap = true}
keymap('n','<space>cp','<cmd> CompileLatex pdflatex<CR>',opts)
keymap('n','<space>cx','<cmd> CompileLatex xelatex<CR>',opts)
keymap('n','<space>cl','<cmd> CompileLatex lualatex<CR>',opts)
keymap('n','<space>vp','<cmd> ViewPdf<CR>',{noremap =  true, silent = true})
keymap('n','<space>vl','<cmd> ViewLatexLog<CR>',{noremap =  true, silent = true})
