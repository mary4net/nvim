return {
  {
    'jay-babu/mason-nvim-dap.nvim',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    opts = {
      ensure_installed = {
        'codelldb',
      },
      handlers = {
        function(config)
          local dap = require 'dap'

          vim.g.is_run_last = false

          dap.adapters.codelldb = {
            type = 'executable',
            command = vim.fn.stdpath 'data' .. '/mason/bin/codelldb',
            args = {},
          }

          vim.g.last_program = vim.g.last_program or nil
          vim.g.last_args = vim.g.last_args or nil

          dap.configurations.c = {
            {
              name = 'Launch C Program',
              type = 'codelldb',
              request = 'launch',
              program = function()
                if vim.g.is_run_last and vim.g.last_program then
                  return vim.g.last_program
                end
                vim.g.last_program = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                return vim.g.last_program
              end,
              args = function()
                if vim.g.is_run_last and vim.g.last_args then
                  return vim.g.last_args
                end
                vim.g.last_args = vim.split(vim.fn.input 'Arguments: ', ' ')
                return vim.g.last_args
              end,
              cwd = vim.fn.getcwd(),
              stopOnEntry = false,
            },
          }
        end,
      },
    },
  },
}

-- function(config)
--   -- all sources with no handler get passed here
--
--   -- Keep original functionality
--   require('mason-nvim-dap').default_setup(config)
-- end,
-- codelldb = function(config)
--   config.adapters = {
--     type = 'executable',
--     command = vim.fn.stdpath 'data' .. '/mason/bin/codelldb',
--   }
--
--   vim.api.nvim_create_autocmd('User', {
--     pattern = 'DapSessionStarted',
--     callback = function()
--       local input = vim.fn.input 'Enter program path and arguments (separate by space): ' -- 提示用户输入路径和参数
--       local input_args = vim.fn.split(input, ' ') -- 按空格拆分输入内容
--
--       -- 检查输入的路径和参数
--       local program_path = input_args[1]
--       local args = {}
--
--       if #input_args > 1 then
--         args = vim.list_slice(input_args, 2, #input_args)
--       end
--
--       -- 输出调试日志，检查路径和参数
--       print('Program path: ' .. program_path)
--       print('Arguments: ' .. vim.fn.join(args, ' '))
--
--       -- 更新调试配置
--       config.configurations[1].program = program_path
--       config.configurations[1].args = args
--
--       -- 启动调试器
--       require('mason-nvim-dap').default_setup(config)
--     end,
--   })
--   require('mason-nvim-dap').default_setup(config) -- don't forget this!
-- end,
