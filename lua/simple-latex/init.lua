local M = {}
local opts= require('simple-latex.options')

M.setup = function(options)
    local options = options or false
    if (options) then
        opts.mergeOptions(options)
    end
    if opts.default_mappings then
        require('simple-latex.keymaps')
    end
    require('simple-latex.commands')
end
M.options = opts.opts

return M
