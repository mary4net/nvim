return {
  'mfussenegger/nvim-dap-python',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    -- require('dap-python').setup 'python3'
    local cwd = vim.fn.getcwd()
    local venv = cwd .. '/.venv/bin/python'
    require('dap-python').setup(venv)

    -- Iterate through all python configurations and set justMyCode to false
    local configs = require('dap').configurations.python
    for _, config in ipairs(configs) do
      config.justMyCode = false
    end
  end,
}
