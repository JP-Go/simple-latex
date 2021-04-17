local tutils = {}

local createbuf = function ()
	return vim.api.nvim_create_buf(true,false)
end

tutils.createTestBuf = function ()
	local buf = createbuf()
	return vim.inspect(buf)
end

tutils.createTestBuf()
