local utils = {}
local api = vim.api
local fn = vim.fn

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
	local isSame = true
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

utils.testEnvOperation = function (operation,expectedValue)
	-- TODO operation has to be a string for now, replace with function ref
	local testbuf = utils.createTestBuf()
	api.nvim_set_current_buf(testbuf)
	vim.cmd("lua " .. operation)
	local bufText = getlines(testbuf)
	api.nvim_buf_delete(testbuf,{force = true})
	return compareTablesFields(bufText,expectedValue)
end

return utils
