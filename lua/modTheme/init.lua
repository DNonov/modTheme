local vscode = {}
local config = require('modTheme.config')
local theme = require('modTheme.theme')

-- Pass setup to config module
vscode.setup = config.setup

-- Load colorscheme with a given or default style
---@param style? string
vscode.load = function(style)
    vim.cmd('hi clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    vim.o.termguicolors = true
    vim.g.colors_name = 'modTheme'

    vim.o.background = style or config.opts.style or vim.o.background

    theme.set_highlights(config.opts)
    theme.link_highlight()

    if config.opts.group_overrides then
        for group, val in pairs(config.opts['group_overrides']) do
            vim.api.nvim_set_hl(0, group, val)
        end
    end
end

return vscode
