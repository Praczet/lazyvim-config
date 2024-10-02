return {
  {
    "Praczet/encrypt-text.nvim",
    config = function()
      require("encrypt-text").setup()
    end,
  },
  {
    "Praczet/next-birthday.nvim",
    config = function()
      require("next-birthday").setup({
        bd_file = "/home/adam/Notes/me-social.md",
      })
    end,
  },
  {
    "Praczet/habits-tracker.nvim",
    config = function()
      require("habits-tracker").setup({
        first_dow = "mo", -- Default first day of the week is Monday
        habits = { -- habits to track
          {
            label = "French", -- habit name (section in YAML front matter)
            style = { fg = "red" }, -- not used yet
            -- symbol = "■", -- symbol displayed in calendar
            symbol = "⬤",
          },
          { -- Update this section
            label = "Reading",
            style = { fg = "red" },
            -- symbol = "✔",
            symbol = "⬤",
          },
          { -- Update this section
            label = "Sport",
            style = { fg = "red" },
            symbol = "⬤",
          },
          { -- Update this section
            label = "Develop",
            style = { fg = "red" },
            -- symbol = "⚙",
            symbol = "⬤",
          },
        },
      })
    end,
  },
  {
    "Praczet/words-the-def.nvim",
    config = function()
      require("words-the-def").setup({
        default = "en",
      })
    end,
  },
  {
    "Praczet/yaml-tags.nvim",
    config = function()
      local yaml_tags = require("yaml-tags")
      yaml_tags.setup({
        sanitizer = true,
        included_directories = {
          "~/Notes/",
        },
        excluded_files = {
          "templates/Daily.md",
        },
        excluded_directories = {
          "templates",
          ".git",
        },
        extend_forbidden_words = true,
        forbidden_words = {
          "of",
          "off",
          "ok",
        },
      })
      yaml_tags.initialize()
    end,
    dependencies = {
      "hrsh7th/nvim-cmp", -- nvim-cmp dependency
    },
    ft = "markdown",
  },
  {
    "praczet/markdown-links.nvim",
    config = function()
      require("markdown-links").setup({
        kind_hl_group = "#FFaaaa",
        excluded_folders = {
          "templates",
        },
        notes_folder = "~/Notes/",
      })
    end,
    ft = "markdown",
  },
  {
    "praczet/sql-command.nvim",
    config = function()
      require("sql-command").setup({})
    end,
  },
}
