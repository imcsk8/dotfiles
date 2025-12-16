-- Define a group for project-specific settings to avoid duplication
local libxml_group = vim.api.nvim_create_augroup("LibxmlDev", { clear = true })

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    group = libxml_group,
    -- PATTERN: Adjust this path to match where you cloned the repo!
    -- Example: /home/username/projects/libxml/*
    pattern = "*/projects/gnome/{libxml2,libxslt}**/*.[ch]",
    callback = function()
        -- 1. Visual Representation
        vim.bo.tabstop = 8       -- Physical tab character width
        vim.bo.softtabstop = 4   -- How many spaces 'Tab' key inserts
        vim.bo.shiftwidth = 4    -- Indentation level (>> or <<)

        -- 2. The Hybrid Mode
        -- 'noexpandtab' means use physical \t characters. 
        -- Because shiftwidth(4) < tabstop(8), Neovim will use mixed 
        -- tabs and spaces to achieve 12-space indent (1 Tab + 4 Spaces).
        vim.bo.expandtab = false

        -- 3. Visual Aids
        -- Render tabs visibly so you can see the 8-width blocks
        vim.opt_local.list = true
        vim.opt_local.listchars = { tab = '» ', trail = '·' }

        -- 4. Line Length
        vim.bo.textwidth = 80
        vim.opt_local.colorcolumn = "80"

        -- 5. C-Specific Indentation logic
        -- cinoptions: settings for C-indenting
        -- :0  = Align case labels with switch
        -- t0  = function return type not indented
        -- (0  = align inside parens
        vim.bo.cinoptions = ":0,t0,(0"

        print("Loaded libxml/libxslt dev environment (Tab=8, Indent=4)")
    end,
})
