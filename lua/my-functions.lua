--- Retrieves the 5 most recent notes from the ~/Notes directory.
--- @return table header_lines containing formatted header lines with recent notes and their corresponding file paths.
local function get_recent_notes()
  -- Step 1: Get the current working directory
  local function format_filename(filename, length)
    if #filename > length then
      return filename:sub(1, length - 3) .. "..." -- Truncate and add "..."
    else
      return filename .. string.rep(" ", length - #filename) -- Pad with spaces
    end
  end
  local cwd = vim.fn.getcwd()

  -- Step 2: Check if the current directory is ~/Notes
  local notes_dir = vim.fn.expand("~/Notes")
  if cwd ~= notes_dir then
    return {}
  end

  -- Step 3: Run the jq command to get the 5 most recent notes
  local jq_command = "jq -r '. | sort_by(.created_at) | reverse | .[:5]' ~/Notes/.index.json"
  local jq_output = vim.fn.system(jq_command)

  -- Step 4: Use vim's built-in json_decode to parse the JSON output
  local note_list = vim.fn.json_decode(jq_output)

  -- Step 5: Prepare header lines with recent notes and assign actions 1-5
  local header_lines = {}
  for i, note in ipairs(note_list) do
    table.insert(header_lines, {
      line = string.format("  %s [%d]", format_filename(note.file:match("[^/]+$"), 50), i),
      file = note.file,
    }) -- Display as 1, 2, 3, etc.
  end

  return header_lines
end

--- This function sets up the dashboard with a custom header:
---   - tasks
---   - recent notes
---   - actions  from original dashboard
--- It integrates with several plugins to fetch data and display it on the dashboard.
--- @return table opts The options for the dashboard configuration.
local function dashboard_setting()
  local next = require("next-birthday")
  local lines = next.birthdays("now")

  local ltw = require("little-taskwarrior")
  local tasks = ltw.get_dashboard_tasks()

  -- local ht = require("habits-tracker")
  -- local bar = ht.get_bar_lines("Weight", {})

  local logo = [[

   ...:::...
   ..   ---   ..
   .    (0 0)    .
   .     \=/     .
   .-----------------.
   (      ©ad.art      )
   '''''''''''''''''''
  ]]
  local currentDate = os.date("%Y-%m-%d")
  local padding = math.floor((10 - #currentDate) / 2)
  local centeredDate = string.rep(" ", padding) .. currentDate
  logo = logo .. "\n" .. centeredDate .. "\n"
  local header = vim.split(logo, "\n")
  if lines ~= nil then
    for _, l in ipairs(lines) do
      table.insert(header, l)
    end
  end
  table.insert(header, "")

  if tasks ~= nil then
    for _, t in ipairs(tasks) do
      table.insert(header, t)
    end
    table.insert(header, "")
  end

  -- for _, l in ipairs(bar) do
  -- table.insert(header, l)
  -- end

  local recent_notes = get_recent_notes()

  if #recent_notes > 0 then
    for _, l in ipairs(recent_notes) do
      table.insert(header, l.line)
    end
    table.insert(header, "")
  end

  local opts = {
    theme = "doom",
    hide = {
      statusline = false,
    },
    config = {
      header = header,
      center = {
        { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
        { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
        { action = "Telescope projects", desc = " Projects", icon = " ", key = "p" },
        { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
        { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
        { action = "e $MYVIMRC", desc = " Config", icon = " ", key = "c" },
        { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
        { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "e" },
        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
        { action = "qa", desc = " Quit", icon = " ", key = "q" },
      },
      footer = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        for i, note in ipairs(recent_notes) do
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            tostring(i),
            ":e " .. note.file .. "<CR>",
            { noremap = true, silent = true }
          )
        end
        return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
      end,
    },
  }

  for _, button in ipairs(opts.config.center) do
    button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  end

  -- close Lazy and re-open when the dashboard is ready
  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      pattern = "DashboardLoaded",
      callback = function()
        require("lazy").show()
      end,
    })
  end
  return opts
end

--- Exports the current file to a PDF.
--- This function uses Pandoc to convert the current file to a PDF and saves it in the specified directory.
--- It supports optional themes and integrates with custom Lua filters for additional processing.
--- - The default theme is a dark theme.
--- - The light theme can be specified as an option.
--- - The Lua filters are stored in the ~/Notes/templates directory.
---
--- @param opts table A table containing options for the export, such as the theme to use.
local function export_pdf(opts)
  local current_file = vim.fn.expand("%:p")
  local output_pdf = vim.fn.expand("%:t:r") .. ".pdf"
  current_file = vim.fn.shellescape(current_file)
  output_pdf = vim.fn.shellescape(vim.fn.expand("~/Documents/ExportedPDFs/" .. output_pdf))
  print(current_file, output_pdf)
  local theme_option = opts.args == "light" and ""
    or "--pdf-engine=xelatex -H ~/Documents/ThemesAndTemplates/pandoc/darkmeHeader.tex"
  local command = ":!pandoc "
    .. current_file
    .. " --output="
    .. output_pdf
    .. " "
    .. theme_option
    .. " --lua-filter="
    .. vim.fn.shellescape(vim.fn.expand("~/Notes/templates/mermaid-filter.lua"))
    .. " --lua-filter="
    .. vim.fn.shellescape(vim.fn.expand("~/Notes/templates/callouts-filter.lua"))
  local commandPDF = ":silent " .. "!evince " .. output_pdf .. "&"
  vim.fn.execute(command)
  vim.fn.execute(commandPDF)
end

--- Highlights a specific word in the current buffer.
--- This function sets a custom highlight group for a given word using the same
--- highlight attributes as the `@keyword` highlight group. It ensures that only
--- one word is highlighted at a time by deleting the previous match.
--- @param text string The word to highlight in the current buffer.
local function hl_highlight_word(text)
  local hl = vim.api.nvim_get_hl(0, { name = "@keyword" })
  vim.api.nvim_set_hl(0, "HLWordGroup", {
    bg = hl.bg,
    fg = hl.fg,
    cterm = hl.cterm,
    bold = hl.bold,
    italic = hl.italic,
    reverse = hl.reverse,
  })

  if vim.g.HL_current_match_id then
    vim.fn.matchdelete(vim.g.HL_current_match_id)
  end

  local id = vim.fn.matchadd("HLWordGroup", text)
  vim.g.HL_current_match_id = id
end

--- Replaces the text selected by a motion with the contents of the clipboard.
--- This function prompts the user to enter a motion, deletes the text covered by the motion,
--- and then pastes the contents of the clipboard in its place.
--- It uses the `"_c` command to change the text without affecting the default register.
local function replace_motion_with_clipboard()
  local motion = vim.fn.input("Enter motion: ")
  if motion and motion ~= "" then
    vim.cmd('normal! "_c' .. motion)
    vim.cmd("normal! p")
  end
end

--- Gets the current cursor position in the active window.
--- This function retrieves the current cursor position in the active window and returns it as a table.
--- The position is adjusted to be zero-indexed.
--- @return table pos table containing the row and column of the cursor position, zero-indexed.
local function get_cursor_position()
  local pos = vim.api.nvim_win_get_cursor(0)
  return { pos[1] - 1, pos[2] }
end

--- Deletes a range of text and replaces it with the contents of the clipboard.
--- This function deletes the text between the specified start and end positions in the current buffer,
--- and then pastes the contents of the clipboard in its place.
--- @param start_pos table A table containing the starting row and column, zero-indexed.
--- @param end_pos table A table containing the ending row and column, zero-indexed.
local function delete_range_and_replace_with_clipboard(start_pos, end_pos)
  local buf = vim.api.nvim_get_current_buf()
  local start_line, start_col = start_pos[1], start_pos[2]
  local end_line, end_col = end_pos[1], end_pos[2]
  if start_line > end_line then
    local temp = start_line
    start_line = end_line
    end_line = temp
    temp = start_col
    start_col = end_col
    end_col = temp
    start_line = start_line - 1
  else
    end_line = end_line - 1
    end_col = end_col + 1
  end
  vim.api.nvim_buf_set_text(buf, start_line, start_col, end_line, end_col, { "" })
  vim.cmd("redraw")
  vim.cmd("normal! P")
end

--- Replaces text selected by Flash with the contents of the clipboard.
--- This function uses the Flash plugin to select a range of text, then deletes the selected text
--- and replaces it with the contents of the clipboard.
--- It starts by getting the current cursor position, then uses Flash to jump to the end position,
--- and finally calls `delete_range_and_replace_with_clipboard` to perform the replacement.
local function replace_flash_with_clipboard()
  local start_pos = get_cursor_position()
  require("flash").jump({
    action = function(match)
      local end_pos = match.pos
      delete_range_and_replace_with_clipboard(start_pos, end_pos)
    end,
  })
end

--- Returns a table of functions for various custom Neovim functionalities.
--- This table includes functions for:
--- - configuring the dashboard
--- - exporting files to PDF
--- - highlighting words
--- - replacing text with clipboard contents
--- - retrieving recent notes
--- @return table functions A table containing references to the custom functions.
return {
  DashboardSettings = dashboard_setting,
  ExportPDF = export_pdf,
  HLHighlightWord = hl_highlight_word,
  ReplaceFlashWithClipboard = replace_flash_with_clipboard,
  ReplaceMotionWithClipboard = replace_motion_with_clipboard,
  GetRecentNotes = get_recent_notes,
}
