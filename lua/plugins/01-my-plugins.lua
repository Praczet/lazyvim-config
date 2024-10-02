return {
  {
    require("cmp").setup({
      source = { path = true },
    }),
  },
  { "neovim/nvim-lspconfig" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
      link = {
        enabled = false,
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      LazyVim.toggle.map("<leader>um", {
        name = "Render Markdown",
        get = function()
          return require("render-markdown.state").enabled
        end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      })
    end,
  },
  { "nvim-telescope/telescope-symbols.nvim" },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
  { "kkoomen/vim-doge" },
  {
    "ahmedkhalf/project.nvim",
    opts = {},
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup({
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "*.Rproj" },
        -- patterns = { "*.Rproj" },
      })
      require("telescope").load_extension("projects")
    end,
    keys = {
      { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
    },
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({
        default_mappings = true,
        signs = true,
        mappings = {},
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  { "nvim-neo-tree/neo-tree.nvim" },
  { "nvim-neotest/nvim-nio" },
  { "jannis-baum/vivify.vim" },
}
