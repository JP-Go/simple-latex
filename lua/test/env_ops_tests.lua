local utils = require('utils')
local envOps = require('simple-latex.functions').envOperations
local envOpsTests = {}

envOpsTests.testChangeEnv =  function ()
	-- simulates user input to the ChangeSurroudingEnviroment command
	vim.api.nvim_feedkeys('new'..'\n','c',false)
	local expectedResult =
		{string.format('\\begin{%s}',"new"),' ',string.format('\\end{%s}',"new")}

    local changeResult = utils.testEnvOperation(envOps.change)
    utils.logTest('ChangeSurroudingEnviroment',expectedResult,changeResult)
end

envOpsTests.testStarEnv = function ()
	local expectedResult =
		{string.format('\\begin{%s}',"main*"), ' ', string.format('\\end{%s}',"main*")}

    local changeResult = utils.testEnvOperation(envOps.star)
    utils.logTest('ToggleStarEnviroment',expectedResult,changeResult)
end

envOpsTests.testDeleteEnv = function ()
	local expectedResult = {' '}

    local changeResult = utils.testEnvOperation(envOps.delete)
    utils.logTest('DeleteEnviroment',expectedResult,changeResult)
end

return envOpsTests
