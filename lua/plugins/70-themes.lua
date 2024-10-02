return {
  {
    "folke/tokyonight.nvim",
    opts = {
      -- style = "moon", -- Choose between 'storm', 'night', 'moon'
      -- transparent = false, -- Disable/enable background transparency
      -- terminal_colors = true, -- Use theme colors in Neovim terminal
      -- styles = {
      --   -- comments = { italic = true },
      --   -- keywords = { italic = false },
      --   -- functions = { bold = true },
      --   -- variables = {},
      -- },
    },
  },
  { "altercation/vim-colors-solarized" },
  { "NLKNguyen/papercolor-theme" },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "dark",
      })
    end,
  },
  { "EdenEast/nightfox.nvim" },
  -- { "sainnhe/edge" },
  -- { "eldritch-theme/eldritch.nvim" },
  -- { "projekt0n/github-nvim-theme" },
  -- { "rebelot/kanagawa.nvim" }, -- very yellowish theme
}
