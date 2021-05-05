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

functions.envOperations = {}

functions.envOperations.change = function ()
	local beginPos,endPos = utils.findEnvDelimiters()
	local envName = utils.getEnvName(beginPos)
	local newEnv = fn.input('New Environment name: ')
	utils.subInLine(beginPos,envName,newEnv)
	utils.subInLine(endPos,envName,newEnv)
end
functions.envOperations.delete = function ()
	local beginPos,endPos = utils.findEnvDelimiters()
	utils.deleteLine(endPos)
	utils.deleteLine(beginPos)
end

functions.envOperations.star = function ()
	local beginPos,endPos = utils.findEnvDelimiters()
	local envName = utils.getEnvName(beginPos)
	if (string.find(envName,"*")) then
		utils.subInLine(beginPos,envName,string.match(envName,"%a+"))
		utils.subInLine(endPos,envName,string.match(envName,"%a+"))
	else
		utils.subInLine(beginPos,envName,envName.."*")
		utils.subInLine(endPos,envName,envName.."*")
	end
end

functions.openLog = function ()
	local logpath = string.sub(utils.getLatexFilePath(),0,-4) .. 'log'
	local log = io.open(logpath,"r")
	if (log == nil) then
		command("echo 'Log file not present. Did you compile the file'")
	else
		command(string.format("edit %s",logpath))
		io.close(log)
	end
end

return functions
