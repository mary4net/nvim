return {
  'Shatur/neovim-ayu',
  name = 'ayu',
  priority = 1000,
  config = function()
    require('ayu').setup {
      --   -- You can configure highlights by doing something like:
      --   on_highlights = function(hl_table, color_table)
      --     local from = hl_table.Comment.fg
      --     for opts in pairs(hl_table) do
      --       if opts.fg == from then
      --         opts.fg = color_table.fg_dark
      --       end
      --       if opts.bg == from then
      --         opts.bg = color_table.fg_dark
      --       end
      --       if opts.sp == from then
      --         opts.sp = color_table.fg_dark
      --       end
      --     end
      --     hl_table.LineNrAbove = { fg = color_table.fg_dark }
      --     hl_table.LineNrBelow = { fg = color_table.fg_dark }
      --   end,
    }
    vim.cmd.colorscheme 'ayu'
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#636a72', italic = true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#636a72', italic = true })
  end,
}
