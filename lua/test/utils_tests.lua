local testUtils = require('utils')
local utils = dofile('/home/jp/code/simple-latex/lua/simple-latex/utils.lua')
-- local utils =  require('simple-latex.utils')
local expand  = vim.fn.expand
local cmd = vim.cmd
local M = {standalone={},integration={}}

M.standalone.checkExecutableTest = function()
    local result = utils.checkExecutable('grep')
    testUtils.logTest('checkExecutable',true,result)
end

M.standalone.checkLatexOutputDirectoryTest = function()
    cmd('e main.tex')
    local result = utils.getLatexOutputDirectory()
    testUtils.logTest('checkLatexOutputDirectoryTest [in cwd]','',result)
    cmd('bdelete')
    cmd('e output/main.tex')
    local newResult = utils.getLatexOutputDirectory()
    local expectedResult = ('--output-dir=' .. expand('%:p:h'))
    testUtils.logTest('checkLatexOutputDirectoryTest [other dir]',expectedResult,newResult)
    cmd('bdelete')
end

M.standalone.checkLatexFilePathTest = function ()
    cmd('e main.tex')
    local result = utils.getLatexFilePath()
    testUtils.logTest('getLatexFilePathTest [in cwd]',expand('%:t'),result)
    cmd('bdelete')
    cmd('e output/main.tex')
    local newResult = utils.getLatexFilePath()
    testUtils.logTest('getLatexFilePathTest [other dir]',expand('%:p'),newResult)
    cmd('bdelete')
end

M.integration.getCompileOptionsWhenEmptyTest = function (optionsTable)
    local result = utils.getCompileOptions(optionsTable)
    testUtils.logTest('getCompileOptionsWhenEmptyTest','',result)
end

M.integration.getCompileOptionsWhenNotEmptyTest = function(optionsTable,expectedResult)
    local result = utils.getCompileOptions(optionsTable)
    testUtils.logTest('getCompileOptionsWhenNotEmptyTest',expectedResult,result)
end

return M
