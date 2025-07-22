return {
  -- {
  --   "williamboman/mason.nvim",
  --   opts = { ensure_installed = { "ktlint" } },
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "kotlin" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {},
      },
    },
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   optional = true,
  --   dependencies = "williamboman/mason.nvim",
  --   opts = {
  --     linters_by_ft = { kotlin = { "ktlint" } },
  --   },
  -- },
}
