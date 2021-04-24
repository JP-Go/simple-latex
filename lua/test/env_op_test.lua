local utils = require('utils')
local envOperationsTests = {}

envOperationsTests.testChangeEnv =  function (newEnv)
	local operation = "require('simple-latex.functions').envOperations.change()"
	-- simulates user input
	vim.api.nvim_feedkeys(newEnv..'\n','c',false)
	local newBegin = string.format('\\begin{%s}',newEnv)
	local newEnd = string.format('\\end{%s}',newEnv)
	local expectedValue = {newBegin, ' ', newEnd}

	local testPassed,resultOfOperation = utils.testEnvOperation(operation,expectedValue)

	if (not testPassed) then
		print('[ERROR] in testChangeEnv.Got: \n')
		print(table.concat(resultOfOperation,'\n'))
		print('Expected \n')
		print(table.concat(expectedValue,'\n'))
		return
	end
	print('[Passed] testChangeEnv')
end

return envOperationsTests
