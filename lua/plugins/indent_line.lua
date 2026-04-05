local highlight = {
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    config = function()
      local hooks = require 'ibl.hooks'
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#a075b3', underline = false })
        vim.api.nvim_set_hl(0, 'DimGrey', { fg = '#42496a', underline = false })
      end)
      require('ibl').setup {
        indent = { highlight = 'DimGrey' },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
          highlight = { 'RainbowViolet' },
        },
      }
    end,
  },
}
