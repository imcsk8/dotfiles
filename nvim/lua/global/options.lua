vim.g.have_nerd_font = true     -- Set to true if you have a Nerd Font installed and selected in the terminal
vim.o.number = true             -- Show line numbers
vim.o.clipboard = "unnamedplus" -- Sync clipboard between neoviem and the OS 
vim.o.autoindent = true         -- Autoindent
vim.o.shiftwidth = 4            -- Number of spaces inserted for each indentation
vim.o.tabstop = 4               -- Insert n spaces for a tab
vim.o.expandtab = true          -- Convert tabs to spaces
vim.o.smartindent = true        -- Smart indent
vim.opt.termguicolors = true    -- set termguicolors to enable highlight groups
vim.o.wrap = false              -- display lines as one long line
vim.o.mouse = 'a'               -- Enable mouse mode
vim.o.conceallevel = 0          -- Show symbols in markup languages and envlopes like JSON
vim.o.fileencoding = 'utf-8'    -- the encoding written to a file
vim.o.signcolumn = 'yes'        -- Keep signcolumn on by default
vim.o.list = true               -- Show invisible characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- What to show for this characters
vim.o.filetype = "on"           -- Enable file type detection

vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- separate vim plugins from neovim in case vim still in use
