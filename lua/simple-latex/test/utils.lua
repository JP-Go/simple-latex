local utils = {}
local api = vim.api

local createbuf = function ()
	return api.nvim_create_buf(true,false)
end
local setlines = function (bufhandle,lines)
	return api.nvim_buf_set_lines(bufhandle,0,table.maxn(lines),false,lines)
end
utils.createTestBuf = function ()
	local buf = createbuf()
	setlines(buf,{"\\begin{main}"," ","\\end{main}"})
	return buf
end

utils.assertBufValue = function (func,value)
	local testbuf = utils.createTestBuf()
end
return utils
