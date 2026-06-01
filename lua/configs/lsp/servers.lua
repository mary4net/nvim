return {
  clangd = {
    -- cmd = { 'clangd', '--compile-commands-dir=build', '--header-insertion=never' },
    cmd = { 'clangd' },
    -- init_options = {
    --   compilationDatabasePath = 'build',
    --   clangdFileStatus = true,
    --   fallbackFlags = { '-D_GNU_SOURCE' },
    -- },
  },
  -- glsl_analyzer = {},
  -- sqls = {
  --   filetypes = { 'sql', 'ddl' },
  --   root_dir = require('lspconfig.util').root_pattern('.git', 'db-schema.sql'),
  --   settings = {
  --     sqls = {
  --       connections = {
  --         {
  --           driver = 'postgresql',
  --           dataSourceName = 'host=mcsdb.utm.utoronto.ca user=xuruili password=94926 dbname=xuruili_343 sslmode=disable',
  --         },
  --       },
  --     },
  --   },
  -- },
  -- gopls = {},
  ruff = {},
  jedi_language_server = {},
  rust_analyzer = {},
  -- rust_analyzer = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --
  -- Some languages (like typescript) have entire language plugins that can be useful:
  --    https://github.com/pmizio/typescript-tools.nvim
  --
  -- But for many setups, the LSP (`ts_ls`) will work just fine
  -- ts_ls = {},
  eslint = {},
  --
  -- jdtls = {
  --   settings = {
  --     java = {
  --       format = {
  --         settings = {
  --           url = 'file://' .. home .. '/.config/nvim/eclipse-formatter.xml',
  --           profile = 'NeovimFormatter',
  --         },
  --       },
  --     },
  --   },
  -- },
  lua_ls = {
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
}
