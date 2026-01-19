return {
  'Shatur/neovim-ayu',
  name = 'ayu',
  priority = 1000,
  config = function()
    require('ayu').colorscheme() -- 别忘记启用
  end,
}
