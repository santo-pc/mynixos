-- Place status bar at 0 to prevent going above cmd line
-- set cmdcmdheight = 0
vim.o.ch = 1

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

return {

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  -- disabling unused plugins
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "echasnovski/mini.animate", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "stevearc/dressing.nvim", enabled = false },
  { "echasnovski/mini.bufremove", enabled = false },
  { "folke/persistence.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "echasnovski/mini.pairs", enabled = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "cpp",
        "c",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "php",
        "rust",
        "scss",
        "sql",
        "svelte",
        "python",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },

  "sschleemilch/slimline.nvim",
  opts = {
    lazy = false,
    style = "fg",
    configs = {
      mode = {
        verbose = true,
      },
    },
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --
  --     options = {
  --       section_separators = { left = "", right = "" },
  --       component_separators = { left = "", right = "" },
  --     },
  --     sections = {
  --       lualine_c = {
  --         LazyVim.lualine.root_dir(),
  --         {
  --           "diagnostics",
  --           -- symbols = {
  --           --   error = icons.diagnostics.Error,
  --           --   warn = icons.diagnostics.Warn,
  --           --   info = icons.diagnostics.Info,
  --           --   hint = icons.diagnostics.Hint,
  --           -- },
  --         },
  --       },
  --       lualine_z = {
  --         function()
  --           return ""
  --         end,
  --       },
  --       lualine_x = { "encoding", "fileformat", "filetype" },
  --     },
  --   },
  -- },
}
