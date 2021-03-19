local createcmd = require('latex.utils').createCmd

vim.api.nvim_exec([[  fun! GetEngines (a,b,c)
              return g:simple_latex_enines
            endfun ]],false)
createcmd({
  {'-nargs=1 -bar -complete=customlist,GetEngines','CompileLatex','lua require(\'latex.functions\').CompileLatex(<f-args>)' },
  {'','PreviewPdf',string.format('lua require(\'latex.functions\').OpenPdf(\'%s\')',vim.g.simple_latex_viewer)},
  {'','ChangeSurroudingEnviroment','lua require(\'latex.functions\').operateInSurrEnv(\'c\')'},
  {'','ToggleStarEnviroment','lua require(\'latex.functions\').operateInSurrEnv(\'s\')'},
  {'','DeleteEnviroment','lua require(\'latex.functions\').operateInSurrEnv(\'d\')'}
})

if (vim.g.simple_latex_default_mappings) then
	require('latex.keymaps')
end
