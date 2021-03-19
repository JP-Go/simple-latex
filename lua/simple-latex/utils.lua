local utils = {}
local fn = vim.fn
local callcommand = vim.cmd
-- Compilation and file handling
utils.checkExecutable = function(exe)
  local isPresent = fn.executable(exe)
  if isPresent ~= 1 then return false end
  return true
end

utils.getLatexOutputDirectory = function()
  local cwd = fn.getcwd(0,0)
  local filedir = fn.expand("%:p:h")
  if cwd == filedir then return '' end
  return '--output-dir=' .. filedir
end

utils.getLatexFilePath = function ()
  local isInCwd = utils.getLatexOutputDirectory() == '' and true or false
  if isInCwd then return fn.expand("%:t") end
  return fn.expand("%:p")
end

-- Command and keymapping creation
utils.createCmd = function(cmds)
  for _,v in ipairs(cmds) do
	vim.api.nvim_command(':command!' .. table.concat(v,' '))
		end
end

utils.createKeymap = function (...)
  vim.api.nvim_buf_set_keymap(0,...)
end

-- Enviroments operation
utils.getEnvName = function (linenum)
  local lineContent  = fn.getline(linenum)
  local capture = fn.matchlist(lineContent,'begin{\\(.*\\)}')
  return capture[2]
end
utils.findEnvDelimiters =  function()
	local beginPat = "begin{.*}"
	local beginPos = fn.search(beginPat,'bcn')
	local endPat = string.format("\\Mend{%s}",utils.getEnvName(beginPos))
	local endPos = fn.search(endPat,'')
	return beginPos,endPos
end

utils.subInLine = function (linenum,patToFind,patToReplace)
  fn.cursor(linenum,1)
	local sub = string.format('sno/%s/%s',patToFind,patToReplace)
	callcommand(sub)
end

utils.deleteLine = function (linenum)
  fn.cursor(linenum,1)
  callcommand('.delete')
end

utils.createInputWin = function ()
  local width = 32
  local height = 4
  local bufh = vim.api.nvim_create_buf(false,true)
  local marginH = {}
  table.insert(marginH,'===New Environment===')
  vim.api.nvim_buf_set_text(bufh,0,0,width,height,marginH)
  local floatWin = vim.api.nvim_open_win(bufh,true,
    {relative = 'cursor',width=width,row=30,col=4,height=height,style="minimal"})
end
return utils
