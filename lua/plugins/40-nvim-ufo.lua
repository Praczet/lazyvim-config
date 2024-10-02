local function fold_handler_add_comment(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  -- local suffix = ("  %d "):format(endLnum - lnum)
  local targetWidth = width
  local curWidth = 0

  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    local hlGroup = chunk[2]

    -- If the first line is a PHPDoc comment
    if chunkText:match("^%s*%/%*%*%s*$") then
      -- Find the next line and append it to the fold text

      local nextLine = vim.fn.getline(lnum + 1)
      if nextLine:match("^%s*%*") then
        chunkText = chunkText .. " " .. nextLine:gsub("^%s*%*", "")
      end
    end

    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, { chunkText, hlGroup })
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      table.insert(newVirtText, { chunkText, hlGroup })
      break
    end
    curWidth = curWidth + chunkWidth
  end
  return newVirtText
end

return {

  { "kevinhwang91/promise-async" },
  {
    "kevinhwang91/nvim-ufo",
    requires = { "kevinhwang91/promise-async" },
    config = function()
      require("ufo").setup({
        fold_virt_text_handler = fold_handler_add_comment,
      })
    end,
  },
}
