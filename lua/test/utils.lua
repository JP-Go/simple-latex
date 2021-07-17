local utils = {}
local api = vim.api
-- local fn = vim.fn

-- Helper Functions
local createbuf = function ()
	return api.nvim_create_buf(true,false)
end
local setlines = function (bufhandle,lines)
	return api.nvim_buf_set_lines(bufhandle,0,#lines,false,lines)
end
local getlines = function (bufhandle)
	local numOfLines = api.nvim_buf_line_count(bufhandle)
	return api.nvim_buf_get_lines(bufhandle,0,numOfLines,false)
end

local compareTablesFields = function (t1,t2)
	for lnum, line in ipairs(t1) do
		if t2[lnum] ~= line then
			return false
		end
	end
	return true
end

-- End Helper Functions

utils.createTestBuf = function ()
	local buf = createbuf()
	setlines(buf,{"\\begin{main}"," ","\\end{main}"})
	return buf
end

-- returns a boolean to tell if the operation was successful and
-- the test buffer text
utils.testEnvOperation = function (operation,expectedValue)
    -- TODO: operation should be a function reference
	local testbuf = utils.createTestBuf()
	api.nvim_set_current_buf(testbuf)
	require('simple-latex.functions').envOperations[operation]()
	local bufText = getlines(testbuf)
	api.nvim_buf_delete(testbuf,{force = true})
	return compareTablesFields(bufText,expectedValue),bufText
end

utils.logResultOfEnvOperationsIfFailed = function (operation,expectedValue,valueGot)
    local logIfFailed =  ''
    logIfFailed = table.concat({"ERROR in Environment Operation [", operation, "]\nExpected:\n",
                            table.concat(expectedValue,"\n"),"\nGot\n",
                            table.concat(valueGot,"\n") }, " ")
    return logIfFailed
end

utils.logIfFailed =  function (expectedValue,valueGot)
    return true
end

utils.logIfSuccess = function ()
    -- code
end

utils.assertOperation = function (operation,expectedValue)
	local testPassed,resultOfOperation = utils.testEnvOperation(operation,expectedValue)
	local logIfFailed = utils.logResultOfEnvOperationsIfFailed(operation,expectedValue,resultOfOperation)
	assert(testPassed,logIfFailed)
end

utils.assertValue = function (operation,expectedValue)
    local testSubjectResult = operation()
    if testSubjectResult ~= expectedValue then
        return true
    end
end

return utils
