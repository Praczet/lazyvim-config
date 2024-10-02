local dashboard_config = require("my-functions")
return {
  {
    "praczet/little-taskwarrior.nvim",
    config = function()
      require("little-taskwarrior").setup({
        get_dashboard_config = dashboard_config.DashboardSettings,
        urgency_threshold = 7,
        debug = false,
        dashboard = {
          max_width = 56,
        },
      })
    end,
  },
}
