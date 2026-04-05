return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
        -- comments = { italic = false }, -- Disable italics in comments
      },

      -- You can configure highlights by doing something like:
      on_highlights = function(hl_table, color_table)
        local from = hl_table.Comment.fg
        for group, opts in pairs(hl_table) do
          if opts.fg == from then
            opts.fg = color_table.fg_dark
          end
          if opts.bg == from then
            opts.bg = color_table.fg_dark
          end
          if opts.sp == from then
            opts.sp = color_table.fg_dark
          end
        end
        hl_table.LineNrAbove = { fg = color_table.fg_dark }
        hl_table.LineNrBelow = { fg = color_table.fg_dark }
      end,
    }
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-night', tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight-moon'
  end,
}
