local myf = require("my-functions")

-- My custom Commad to export md as PDF
vim.api.nvim_create_user_command("PDFExport", myf.ExportPDF, { nargs = "*" })

-- simply and useless method to highlight a word
vim.api.nvim_create_user_command("HLWord", function(opts)
  myf.HLHighlightWord(opts.args)
end, { nargs = 1 })
