return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',

  -- NOTE: And you can specify dependencies as well
  event = 'VeryLazy',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },

  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    vim.keymap.set('n', '<F4>', function()
      vim.g.is_run_last = true
      dap.run_last()
    end, { desc = '[D]ebugger run [L]ast' })

    vim.keymap.set('n', '<F5>', function()
      vim.g.is_run_last = false
      dap.continue()
    end, { desc = 'Debug: Start/Ctn' })
    -- vim.keymap.set('n', '<F4>', dap.run_last, { desc = '[D]ebugger run [L]ast' })
    -- vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Ctn' })
    vim.keymap.set('n', '<F6>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F7>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F8>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F9>', dap.terminate, { desc = 'Debug: Terminate' })
    vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'Debugger Toggle [b]reakpoint' })
    vim.keymap.set('n', '<Leader>B', dap.set_breakpoint, { desc = 'Debugger Set [B]reakpoint' })
    vim.keymap.set('n', '<F3>', dapui.toggle, { desc = 'Debug: See last session result' })
    vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = '[D]ebugger [R]epl' })
    vim.keymap.set('n', '<Leader>lp', function()
      dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
    end, { desc = 'Debugger [L]og [P]oint' })

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Change breakpoint icons
    -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    -- local breakpoint_icons = vim.g.have_nerd_font
    --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    -- for type, icon in pairs(breakpoint_icons) do
    --   local tp = 'Dap' .. type
    --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    -- end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    -- require('dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- }
  end,
}
