local utils = require('simple-latex.utils')
local command = vim.cmd
local fn = vim.fn
local functions = {}

functions.compileLatex = function (engine)
  if utils.checkExecutable(engine) then
    local filepath = utils.getLatexFilePath()
    local outDir = utils.getLatexOutputDirectory()
    command('!' .. engine .. ' ' ..outDir .. ' ' .. filepath )
    return
  end
  print("Executable not found. Please check if "..engine .." is installed and set in $PATH" )
end

functions.openPdf = function (viewer)
local pdfpath = string.sub(utils.getLatexFilePath(),0,-4) .. 'pdf'
  if utils.checkExecutable(viewer) then
    local opencmd = string.format("!%s %s &",viewer,pdfpath)
    command(opencmd)
    return
  end
command(string.format("!xdg-open %s &",pdfpath))
  print("[WARN] Using fallback value 'xdg-open'")
end

-- TODO: Implement the operateInSurrEnv function as a table of functions instead
functions.operateInSurrEnv = function (flag)
  local view = fn.winsaveview()
  local beginPos,endPos = utils.findEnvDelimiters()
  local envName = utils.getEnvName(beginPos)
  if(flag == "c") then
    local newEnv = fn.input('New Environment name: ')
    utils.subInLine(beginPos,envName,newEnv)
    utils.subInLine(endPos,envName,newEnv)
  elseif (flag == "d") then
    utils.deleteLine(endPos)
    utils.deleteLine(beginPos)
  elseif (flag == "s") then
    if (string.find(envName,"*")) then
      utils.subInLine(beginPos,envName,string.match(envName,"%a+"))
      utils.subInLine(endPos,envName,string.match(envName,"%a+"))
    else
      utils.subInLine(beginPos,envName,envName.."*")
      utils.subInLine(endPos,envName,envName.."*")
    end
  fn.winrestview(view)
  end
end
return functions
