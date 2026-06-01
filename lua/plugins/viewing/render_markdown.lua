-- return {
--   'MeanderingProgrammer/render-markdown.nvim',
--   dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
--   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
--   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
--   ---@module 'render-markdown'
--   ---@type render.md.UserConfig
--
--   config = function()
--     local function md_callout_colors()
--       -- keep blockquote body text in the default color
--       vim.api.nvim_set_hl(0, '@markup.quote.markdown', { link = 'RenderMarkdownSuccess' })
--       -- if your theme also defines a bare capture, normalise that too
--       vim.api.nvim_set_hl(0, '@markup.quote', { link = 'Normal' })
--     end
--
--     md_callout_colors()
--     vim.opt.tabstop = 2
--     vim.api.nvim_create_autocmd('ColorScheme', {
--       callback = md_callout_colors,
--     })
--   end,
-- }
return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
