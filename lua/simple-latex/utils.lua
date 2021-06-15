local utils = {}
local fn = vim.fn
local command = vim.cmd

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

-- TODO: Should be able to set this on the CompileLatex command
utils.getCompileOptions = function ()
	local options = ''
	if ( vim.g.simple_latex_compile_options ~= nil ) then
		options = options .. table.concat(vim.g.simple_latex_compile_options,' ')
	end
	return table.concat({options,utils.getSynctexOption()},' ')
end

utils.getSynctexOption = function ()
	if ( vim.g.simple_latex_synctex ~= nil ) then
		local synctexLevel = string.format('%d' , vim.g.simple_latex_synctex )
		return '--synctex='.. synctexLevel ..' '
	end
	return ''
end

-- Command and keymapping creation
utils.createCmd = function(cmds)
	for _,v in ipairs(cmds) do
		command('command!' .. table.concat(v,' '))
	end
end

utils.createKeymap = function (...)
	vim.api.nvim_buf_set_keymap(0,...)
end

-- Enviroments operation
utils.getEnvName = function (linenum)
	local lineContent  = fn.getline(linenum)
	local capture = fn.matchlist(lineContent,'begin{\\(\\w*\\*\\?\\)}')
	return capture[2]
end
utils.findEnvDelimiters =  function()
	local beginPat = "begin{\\w*\\*\\?}"
	local beginPos = fn.search(beginPat,'bc')
	local endPat = string.format("\\Mend{%s}",utils.getEnvName(beginPos))
	local endPos = fn.search(endPat,'n')
	return beginPos,endPos
end

utils.subInLine = function (linenum,patToFind,patToReplace)
	fn.cursor(linenum,1)
	local sub = string.format('sno/%s/%s',patToFind,patToReplace)
	command(sub)
end

utils.deleteLine = function (linenum)
	fn.cursor(linenum,1)
command('.delete')
end
return utils
