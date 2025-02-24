return {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      require("cmp").config.setup.buffer({
        sources = { { name = "crates" } },
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- add rust to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "rust")
    end,
  },

  -- correctly setup lspconfig for Rust 🚀
  {
    "neovim/nvim-lspconfig",
    dependencies = { "simrat39/rust-tools.nvim" },
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          require("lazyvim.util").lsp.on_attach(function(client, buffer)
            if client.name == "rust_analyzer" then
              -- stylua: ignore
              vim.keymap.set("n", "<leader>co", "<cmd>RustHoverActions<CR>", { buffer = buffer, desc = "Hover Actions (Rust)" })
              vim.keymap.set(
                "n",
                "<leader>cR",
                "<cmd>RustCodeActionGroup<CR>",
                { buffer = buffer, desc = "Code Action (Rust)" }
              )
            end
          end)
          local rust_opts = {
            server = vim.tbl_deep_extend("force", {}, opts, opts.server or {}),
            tools = { -- rust-tools options
              -- options same as lsp hover / vim.lsp.util.open_floating_preview()
              hover_actions = {
                -- whether the hover action window gets automatically focused
                auto_focus = true,
              },
            },
          }
          require("rust-tools").setup(rust_opts)
          return true
        end,
      },
    },
  },
}
