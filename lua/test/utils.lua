local utils = {}
local api = vim.api

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
	for key, value in ipairs(t1) do
		if t2[key] ~= value then
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
utils.testEnvOperation = function (operation)
    -- TODO: operation should be a function reference
	local testbuf = utils.createTestBuf()
	api.nvim_set_current_buf(testbuf)
    operation()
	local bufText = getlines(testbuf)
	api.nvim_buf_delete(testbuf,{force = true})
	return bufText
end


utils.formatTableForLog = function (tbl)
    local formattedTable = table.concat(tbl,'\n')
    return formattedTable
end

utils.logTest = function(operation,expectedValue,valueGot)
    local result =  utils.compareValue(expectedValue,valueGot)
    if result == false then
        utils.logIfFailed(operation,expectedValue,valueGot)
        return
    end
    utils.logIfSuccess(operation)

end
utils.logIfFailed =  function (operation,expectedValue,valueGot)
    if type(expectedValue) == "table" then
        print('[ERROR] in ' .. operation ..'\nExpects: ' ..
            utils.formatTableForLog(expectedValue) .. '\nGot: ' ..
            utils.formatTableForLog(valueGot))
        return
    end
    print( ('[ERROR] in %s\nExpects: %s\nGot:%s\n'):format(operation,expectedValue,valueGot) )
end

utils.logIfSuccess = function (operation)
    print( ('[PASSED] in %s'):format(operation))
end

utils.compareValue = function (value,expectedValue)
    if type(value) == 'table' then
        return compareTablesFields(value,expectedValue)
    end
    if value ~= expectedValue then
        return false
    end
    return true
end

return utils
