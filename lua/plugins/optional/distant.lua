-- for nvim + ssh access
return {
  'chipsenkbeil/distant.nvim',
  branch = 'v0.3',
  config = function()
    require('distant'):setup {
      bin = vim.fn.expand '~/.local/bin/distant',
      manager = {
        auto_start = false,
      },
    }
  end,
}
