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
  print("[WARN] Using fallback value 'xdg-open'")
	command(string.format("!xdg-open %s &",pdfpath))
end

-- TODO: Implement the operateInSurrEnv function as a table of functions instead


local view = fn.winsaveview()
local beginPos,endPos = utils.findEnvDelimiters()
functions.envOperations = {}

functions.envOperations.change = function ()
	local envName = utils.getEnvName(beginPos)
	local newEnv = fn.input('New Environment name: ')
	utils.subInLine(beginPos,envName,newEnv)
	utils.subInLine(endPos,envName,newEnv)
	fn.winrestview(view)
end
functions.envOperations.delete = function ()
	utils.deleteLine(endPos)
	utils.deleteLine(beginPos)
  fn.winrestview(view)
end

functions.envOperations.star = function ()
		local envName = utils.getEnvName(beginPos)
    if (string.find(envName,"*")) then
      utils.subInLine(beginPos,envName,string.match(envName,"%a+"))
      utils.subInLine(endPos,envName,string.match(envName,"%a+"))
    else
      utils.subInLine(beginPos,envName,envName.."*")
      utils.subInLine(endPos,envName,envName.."*")
    end
  fn.winrestview(view)
end

return functions
