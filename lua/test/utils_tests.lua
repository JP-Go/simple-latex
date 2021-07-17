package.path = '../simple-latex/?.lua;' .. package.path
-- local testingUtils = require('utils')
local utils =  require('simple-latex.utils')
local M = {}

M.checkExecutableTest = function()
    local exec = 'grep'
    assert(utils.checkExecutable(exec) == true, 'Error in utils.checkExecutable()')
end

M.checkLatexOutputDirectoryTest = function()
    local errMsg = 'ERROR in utils.getLatexOutputDirectory()'
    assert(utils.getLatexOutputDirectory() == '',errMsg)
    vim.cmd('chdir '..vim.fn.expand('~'))
    assert(utils.getLatexOutputDirectory() == '--output-dir=' .. vim.fn.expand("%:p:h"),errMsg)
    vim.cmd('chdir '.. vim.fn.expand("%:p:h"))
end



return M
