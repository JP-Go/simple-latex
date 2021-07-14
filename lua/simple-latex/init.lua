local M = {}
local opts= require('simple-latex.options')

M.setup = function(options)
    local options = options or false
    opts.mergeOptions(options)

    if opts.default_mappings then
        require('simple-latex.keymaps')
    end
    require('simple-latex.commands')
end
M.options = opts

return M
