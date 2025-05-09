-- native
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false -- Las lineas no se continuan en el siguiente renglón
vim.o.list = true -- Habilita que los caracteres especiales sean visibles
vim.opt.listchars = {
  tab = "⇄ ", -- Tabs se muestran como "⇄ " (necesita espacio después)
  trail = "", -- Espacios al final de la linea como ""
  lead = "•", -- Espacios al inicio de linea como "•"
  nbsp = "␣", -- Espacios no separables como "␣"
  extends = "", -- Líneas extendidas a la derecha (scroll horizontal)
  precedes = "", -- Líneas extendidas a la izquierda
}
vim.o.showtabline = 0 -- Esconde la linea de buffers
vim.o.laststatus = 3 -- Statusline global

-- plugins
require("onedarkpro").setup({
  styles = {
    types = "NONE",
    methods = "NONE",
    numbers = "NONE",
    strings = "italic",
    comments = "italic",
    keywords = "bold,italic",
    constants = "bold",
    functions = "italic",
    operators = "NONE",
    variables = "bold",
    parameters = "bold",
    conditionals = "italic",
    virtual_text = "NONE",
  },
})
vim.cmd.colorscheme("onedark_vivid")

require("neo-tree").setup({
  close_if_last_window = true,
  default_component_configs = {
    modified = {
      symbol = "󰐖",
      highlight = "NeoTreeModified",
    },
    indent = {
      with_markers = false,
      indent_marker = "",
      last_indent_marker = "",
    },
  },
  sources = {
    "filesystem",
    "buffers",
    "git_status",
    "diagnostics",
  },
  source_selector = {
    truncation_character = "…",
    winbar = true,
    sources = {
      { source = "filesystem", display_name = "󰉓 Files" },
      { source = "buffers", display_name = "󰈚 Buff." },
      { source = "git_status", display_name = "󰊢 Git" },
      { source = "diagnostics", display_name = " Diag." },
    },
  },
  filesystem = {
    filtered_items = {
      visible = true, -- Muestra los archivos ocultos por defecto
      hide_dotfiles = false, -- No ocultar archivos que comienzan con .
      hide_gitignored = false, -- No ocultar archivos ignorados por git
    },
    follow_current_file = {
      enabled = true, -- This will find and focus the file in the active buffer every time
      --               -- the current file is changed while the tree is open.
      leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
    hijack_netrw_behavior = "open_default", -- Comportamiento al abrir directorios
  },
})

require("which-key").setup({
  preset = "helix",
  win = {
    title = true,
    title_pos = "center",
  },
  sort = { "alphanum" },
})

require("configs.ui.mini")
require("helpview").setup()
