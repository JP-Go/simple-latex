local envOpsTests = require('env_ops_tests')

TEST_COUNTER = 0

for key,_ in pairs(envOpsTests) do
    print(('TEST %d: '):format(TEST_COUNTER))
    envOpsTests[key]()
    TEST_COUNTER = TEST_COUNTER +1
end
