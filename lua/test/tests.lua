local envOpsTests = require('env_ops_tests')
local utilsStandaloneTests = require('utils_tests').standalone
local utilsIntegrationTests = require('utils_tests').integration
-- local utilsStandaloneTests = require('test.utils_tests').standalone
-- local utilsIntegrationTests = require('test.utils_tests').integration
local mockOptionsEmpty = {
    compile_options = false
}

local mockOptionsFilled = {
    compile_options = {'--halt-on-error','--8bit'},
    synctex = 1
}

TEST_COUNTER = 1
for key,_ in pairs(envOpsTests) do
    print(('TEST %d: '):format(TEST_COUNTER))
    envOpsTests[key]()
    TEST_COUNTER = TEST_COUNTER +1
end
for key,_ in pairs(utilsStandaloneTests) do
    print(('TEST %d: '):format(TEST_COUNTER))
    utilsStandaloneTests[key]()
    TEST_COUNTER = TEST_COUNTER +1
end

print(('TEST %d: '):format(TEST_COUNTER))
utilsIntegrationTests.getCompileOptionsWhenEmptyTest(mockOptionsEmpty)
utilsIntegrationTests.getCompileOptionsWhenNotEmptyTest(mockOptionsFilled,'--halt-on-error --8bit --synctex=1')
