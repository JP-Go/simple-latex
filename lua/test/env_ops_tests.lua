local utils = require('utils')
local envOpsTests = {}

envOpsTests.testChangeEnv =  function ()
	-- simulates user input to the ChangeSurroudingEnviroment command
	vim.api.nvim_feedkeys('new'..'\n','c',false)
	local expectedValue =
		{string.format('\\begin{%s}',"new"),' ',string.format('\\end{%s}',"new")}

	utils.assertOperation('change',expectedValue)
end

envOpsTests.testStarEnv = function ()
	local expectedValue =
		{string.format('\\begin{%s}',"main*"), ' ', string.format('\\end{%s}',"main*")}

	utils.assertOperation('star',expectedValue)
end

envOpsTests.testDeleteEnv = function ()
	local expectedValue = {' '}

	utils.assertOperation('delete',expectedValue)
end

return envOpsTests
