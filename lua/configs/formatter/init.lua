return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, hpp = true, sql = true, json = true, python = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return false
      end
      return {
        timeout_ms = 500,
        lsp_format = true,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      hpp = { 'clang-format' },
      -- sql = { 'sql-formatter' },
      -- Conform can also run multiple formatters sequentially
      python = { 'autopep8', 'isort', 'black' },
      java = { 'jdtls' },
      -- json = { 'fixjson' },
      -- jsonc = { 'deno' },
      -- javascript = { 'eslint' },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
    },
    formatters = {
      ['clang-format'] = {
        prepend_args = { '--style={SortIncludes: Never}' },
        -- prepend_args = { '--style={IndentWidth: 4, UseTab: ForIndentation, TabWidth: 4, SortIncludes: Never}' },
      },
      ['deno'] = {
        command = 'deno',
        args = function()
          -- vim.api.nvim_buf_get_name(0) 返回当前 buffer 的绝对路径
          return { 'fmt', '$FILENAME' }
        end,
        stdin = false,
        tmpfile_format = '.conform.$RANDOM.$FILENAME',
      },
    },
  },
}
