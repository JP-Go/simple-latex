local M = {}
local opts= require('options')

M.setup = function(options)
    local options = options or false
    opts.mergeOptions(options)

    if M.opts.default_mappings then
        require('simple-latex.keymaps')
    end
    require('simple-latex.commands')
end
M.options = opts

return M
