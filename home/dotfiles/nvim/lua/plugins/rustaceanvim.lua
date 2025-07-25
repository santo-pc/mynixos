local diagnostics = vim.g.lazyvim_rust_diagnostics or 'rust-analyzer'

return {
  'mrcjkb/rustaceanvim',
  version = vim.fn.has 'nvim-0.10.0' == 0 and '^4' or false,
  ft = { 'rust' },
  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set('n', '<leader>cR', function()
          vim.cmd.RustLsp 'codeAction'
        end, { desc = 'Code Action', buffer = bufnr })
        vim.keymap.set('n', '<leader>dr', function()
          vim.cmd.RustLsp 'debuggables'
        end, { desc = 'Rust Debuggables', buffer = bufnr })
      end,
      default_settings = {
        -- rust-analyzer language server configuration
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          -- Add clippy lints for Rust if using rust-analyzer
          checkOnSave = diagnostics == 'rust-analyzer',
          -- Enable diagnostics if using rust-analyzer
          diagnostics = {
            enable = diagnostics == 'rust-analyzer',
          },
          procMacro = {
            enable = true,
            ignored = {
              ['async-trait'] = { 'async_trait' },
              ['napi-derive'] = { 'napi' },
              ['async-recursion'] = { 'async_recursion' },
            },
          },
          files = {
            excludeDirs = {
              '.direnv',
              '.git',
              '.github',
              '.gitlab',
              'bin',
              'node_modules',
              'target',
              'venv',
              '.venv',
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend('keep', vim.g.rustaceanvim or {}, opts or {})
    if vim.fn.executable 'rust-analyzer' == 0 then
      require('lazy.util').error('**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/', { title = 'rustaceanvim' })
    end
  end,
}
