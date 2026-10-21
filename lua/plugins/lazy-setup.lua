return function()
    -- [[ Install `lazy.nvim` plugin manager ]]
    local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
        local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
        if vim.v.shell_error ~= 0 then
            error('Error cloning lazy.nvim:\n' .. out)
        end
    end
    vim.opt.rtp:prepend(lazypath)

    require('lazy').setup({
        require 'plugins.alpha', -- Welcome mensage and recent files
        require 'plugins.autocompletion', -- Text suggestions and autocompletion
        require 'plugins.bufferline', -- Buffer manager
        require 'plugins.colorschemes', -- Colorscheme plugins
        require 'plugins.csv-view', -- CSV file render
        require 'plugins.gitgraph', -- Gitgraph
        require 'plugins.gitsigns', -- Git plugin
        require 'plugins.lsp', -- lsp configuration
        require 'plugins.lualine', -- Lualine
        require 'plugins.misc', -- Other useful plugins
        require 'plugins.render-markdown', -- Markdown render
        require 'plugins.telescope', -- fzf files explorer
        require 'plugins.treesitter', -- Highlighting
        require 'plugins.yazi',  -- File creation and management
    })
end
