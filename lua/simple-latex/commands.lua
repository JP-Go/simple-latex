local createcmd = require('simple-latex.utils').createCmd

vim.api.nvim_exec([[  fun! GetEngines (a,b,c)
              return g:simple_latex_enines
            endfun ]],false)
createcmd({
  {'-nargs=1 -bar -complete=customlist,GetEngines','CompileLatex','lua require(\'simple-latex.functions\').compileLatex(<f-args>)' },
  {'','PreviewPdf',string.format('silent lua require(\'simple-latex.functions\').openPdf(\'%s\')',vim.g.simple_latex_viewer)},
  {'','ChangeSurroudingEnviroment','lua require(\'simple-latex.functions\').operateInSurrEnv(\'c\')'},
  {'','ToggleStarEnviroment','lua require(\'simple-latex.functions\').operateInSurrEnv(\'s\')'},
  {'','DeleteEnviroment','lua require(\'simple-latex.functions\').operateInSurrEnv(\'d\')'}
})
