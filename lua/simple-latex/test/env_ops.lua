local tutils = {}

local createbuf = function ()  
	return vim.api.nvim_create_buf(false,false)
end

tutils.createTestBuf = function ()
	local buf = createbuf()

end
