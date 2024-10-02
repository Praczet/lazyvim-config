return {
  "stevearc/conform.nvim",
  require("conform").setup({
    formatters_by_ft = {
      css = { "stylelint", "prettierd" },
      markdown = { "prettierd" },
      -- markdown = { { "mdformat" } },
    },
    formatters = {
      stylelint = {
        prepend_args = { "--fix" },
      },
    },
  }),
}
