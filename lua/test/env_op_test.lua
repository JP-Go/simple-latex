local utils = require('utils')
local envOpsTests = {}

envOpsTests.testChangeEnv =  function ()
	local operation = "require('simple-latex.functions').envOperations.change()"
	-- simulates user input to the ChangeSurroudingEnviroment command
	vim.api.nvim_feedkeys('new'..'\n','c',false)
	local expectedValue =
		{string.format('\\begin{%s}',"new"),' ',string.format('\\end{%s}',"new")}

	utils.assertOperation(operation,expectedValue)
end

envOpsTests.testStarEnv = function ()
	local operation = "require('simple-latex.functions').envOperations.star()"
	local expectedValue =
		{string.format('\\begin{%s}',"main*"), ' ', string.format('\\end{%s}',"main*")}

	utils.assertOperation(operation,expectedValue)
end

envOpsTests.testDeleteEnv = function ()
	local operation = "require('simple-latex.functions').envOperations.delete()"
	local expectedValue = {' '}

	utils.assertOperation(operation,expectedValue)
end

return envOpsTests
