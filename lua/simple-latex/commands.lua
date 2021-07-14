local createcmd = require('simple-latex.utils').createCmd

vim.api.nvim_exec([[  fun! GetEngines (a,b,c)
		if exists(g:simple_latex_engines)
            return g:simple_latex_engines
        endif
        return ['pdflatex','xelatex','lualatex']
		endfun ]],false)

local compileCommand = {'-nargs=1 -bar -complete=customlist,GetEngines',
			'CompileLatex',
			'lua require(\'simple-latex.functions\').compileLatex(<f-args>)'
			}

local viewPdfCommand ={'', 
			'ViewPdf',
			string.format('lua require(\'simple-latex.functions\').openPdf(\'%s\')',
			vim.g.simple_latex_viewer) }

local cseCommand = {'','ChangeSurroudingEnviroment','lua require(\'simple-latex.functions\').envOperations.change()'}
local tseCommand = {'','ToggleStarEnviroment','lua require(\'simple-latex.functions\').envOperations.star()'}
local deCommand = {'','DeleteEnviroment','lua require(\'simple-latex.functions\').envOperations.delete()'}
local viewLogCommand = {'','ViewLatexLog','lua require(\'simple-latex.functions\').openLog()'}

createcmd({ compileCommand,viewPdfCommand,cseCommand, tseCommand, deCommand, viewLogCommand })
