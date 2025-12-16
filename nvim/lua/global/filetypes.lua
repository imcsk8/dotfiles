-- Create a dedicated augroup to hold all our autocommands
-- The { clear = true } option ensures that this group is cleared on every reload.
local custom_format_group = vim.api.nvim_create_augroup(
    'CustomFormatting',
    { clear = true }
)

-- Helper function to create autocommands within our group
local function create_autocmd(event, patterns, command)
  vim.api.nvim_create_autocmd(event, {
    group = custom_format_group,
    pattern = patterns,
    callback = command,
  })
end

-- FileType Specific Settings

create_autocmd('FileType', {
        'pl',
        'c',
        'cpp',
        'go',
        'js',
        'py',
        'pp',
        'rs',
        'sh',
        'ts',
        'txt',
        'cs'
    },
    function()
        vim.bo.textwidth = 80
        vim.bo.tabstop = 4
        vim.bo.expandtab = true
        vim.bo.autoindent = true
    end
)

-- Settings for Go
create_autocmd('FileType', { 'go', 'java', 'cs' },
    function()
        vim.bo.tabstop = 4
        vim.bo.expandtab = false
        vim.bo.shiftwidth = 4
        vim.bo.softtabstop = 4
    end
)

-- Settings for shell library files
create_autocmd('FileType', 'shlib',
    function()
        vim.bo.tabstop = 4
        vim.bo.expandtab = false
        vim.bo.syntax = 'bash'
    end
)

-- Settings for Json and Markdown
create_autocmd('FileType', { 'json', 'md', 'yaml', 'yml' },
    function()
        vim.bo.tabstop = 4
        vim.bo.expandtab = true
        vim.o.conceallevel = 0
    end
)

-- Set syntax for Jenkinsfiles
create_autocmd({ 'BufNewFile', 'BufRead' }, 'Jenkinsfile',
    function()
        vim.bo.syntax = 'groovy'
    end
)

create_autocmd('FileType', {
        'tex',
    },
    function()
        vim.bo.textwidth = 80
        vim.bo.tabstop = 4
        vim.wo.spell = true
        vim.bo.spelllang = "es"
    end
)
