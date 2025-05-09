local colors = require("onedarkpro.helpers").get_colors("onedark_vivid")

-- Icons
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()

-- Newbuffer page
require("mini.starter").setup({
  header = [[
$$\   $$\ $$\    $$\ $$$$$$\ $$\      $$\ 
$$$\  $$ |$$ |   $$ |\_$$  _|$$$\    $$$ |
$$$$\ $$ |$$ |   $$ |  $$ |  $$$$\  $$$$ |
$$ $$\$$ |\$$\  $$  |  $$ |  $$\$$\$$ $$ |
$$ \$$$$ | \$$\$$  /   $$ |  $$ \$$$  $$ |
$$ |\$$$ |  \$$$  /    $$ |  $$ |\$  /$$ |
$$ | \$$ |   \$  /   $$$$$$\ $$ | \_/ $$ |
\__|  \__|    \_/    \______|\__|     \__|
  ]],
  footer = [[
All you have to do was follow de damn train CJ!!
  ]],
  items = {
    { name = "Neotree", action = "Neotree focus", section = "Actions" },
    { name = "Terminal", action = "terminal", section = "Actions" },
    { name = "Mason", action = "Mason", section = "Actions" },
    { name = "Lazy", action = "Lazy", section = "Actions" },
    { name = "Check", action = "checkhealt", section = "Actions" },
    { name = "Close", action = "qall", section = "Actions" },
    require("mini.starter").sections.recent_files(10, true, true),
  },
  content_hooks = {
    require("mini.starter").gen_hook.adding_bullet(),
    require("mini.starter").gen_hook.indexing("all"),
    require("mini.starter").gen_hook.aligning("center", "center"),
  },
})

-- Statusline
local MiniStatusline = require("mini.statusline")

local custom_hl = function(group, fg, b, i)
  vim.api.nvim_set_hl(0, group, {
    fg = fg,
    bg = "#303545",
    bold = b or false,
    italic = i or false,
  })
end

custom_hl("MiniStatuslineModenormal", colors.green, true, true)
custom_hl("MiniStatuslineModeInsert", colors.blue, true, true)
custom_hl("MiniStatuslineModeVisual", colors.purple, true, true)
custom_hl("MiniStatuslineModeReplace", colors.orange, true, true)
custom_hl("MiniStatuslineModeCommand", colors.yellow, true, true)
custom_hl("MiniStatuslineModeOther", colors.red, true, true)
custom_hl("MiniStatuslineDevinfo", colors.comment)
custom_hl("MiniStatuslineFilename", colors.fg)
custom_hl("MiniStatuslineFileinfo", colors.fg)

local function location_section(args)
  local line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local col = vim.fn.col(".")
  local total_cols = #vim.fn.getline(".")

  if MiniStatusline.is_truncated(args.trunc_width) then
    return string.format("%d, %d", line, col)
  else
    return string.format("%d/%d, %d/%d", line, total_lines, col, total_cols)
  end
end

local function filename_secction(args)
  local file, icon

  if MiniStatusline.is_truncated(args.trunc_width) then
    file = "%f"
  else
    file = "%F"
  end

  if vim.bo.modified == true then
    icon = " 󰐖"
  elseif vim.bo.modifiable == true then
    icon = ""
  elseif vim.bo.modifiable == false then
    icon = " 󰍵"
  elseif vim.bo.readonly == true then
    icon = " 󰌾"
  elseif vim.bo.buftype == "terminal" then
    return "%t" .. " "
  else
    icon = " ?"
  end

  return file .. icon
end

MiniStatusline.setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git = MiniStatusline.section_git({ trunc_width = 40 })
      local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local filename = filename_secction({ trunc_width = 140 })
      local location = location_section({ trunc_whith = 75 })
      local lsp = MiniStatusline.section_lsp({ trunc_whith = 75 })
      local diff = MiniStatusline.section_diff({ trunc_width = 75 })
      local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = "MiniStatuslineDevinfo", strings = { "❰" } },
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { "❱" } },
        { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
        "%<",
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=",
        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
        { hl = "MiniStatuslineDevinfo", strings = { "❰" } },
        { hl = mode_hl, strings = { search, location } },
        { hl = "MiniStatuslineDevinfo", strings = { "❱" } },
      })
    end,
  },
})

-- Highlight patterns
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
  highlighters = {
    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- Extras
require("mini.indentscope").setup({ symbol = "⎜" })
require("mini.animate").setup({ scroll = { enable = false } })
require("mini.notify").setup()
