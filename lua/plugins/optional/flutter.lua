-- the cross-platform frontend framework (iOS, Android, Web)
-- i decided to use flutter instead of swift(which is apple-only)
return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  flutter_path = '/home/mary/.local/share/flutter/',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = true,
}
