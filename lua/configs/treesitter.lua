return { -- highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  -- [[ configure treesitter ]] see `:help nvim-treesitter`
  config = function()
    require('nvim-treesitter').setup()

    require('nvim-treesitter').install {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'query',
      'vim',
      'vimdoc',
      'markdown',
      'markdown_inline',
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'query',
        'vim',
        'vimdoc',
        'markdown',
      },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
