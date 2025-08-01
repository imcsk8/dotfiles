require 'global.filetypes'
require 'global.keymaps'
require 'global.options'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }

    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
require('lazy').setup({
    require 'plugins.neotree',
    require 'plugins.gitsigns',
    require 'plugins.moonfly',
    require 'plugins.telescope',
    require 'plugins.lazydev',
    require 'plugins.lsp',
    require 'plugins.autocomplete',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    },
    {
        ui = {
            -- If you are using a Nerd Font: set icons to an empty table which will use the
            -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
            icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
            },
        },
})

-- TODO: make this work require 'lspconfig'.perlpls.setup()
vim.cmd [[colorscheme moonfly]]
require('lualine').setup {
    options = {
        theme = 'nightfly'
    }
}
