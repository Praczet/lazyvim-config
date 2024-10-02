--- this file contains my own Dashboard config
local dashboard_config = require("my-functions")
return {
  {
    "nvimdev/dashboard-nvim",
    opts = dashboard_config.DashboardSettings,
  },
}
