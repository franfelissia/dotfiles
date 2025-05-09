vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true
vim.bo.shiftwidth = 2

local conform = require("conform")

conform.formatters.stylua = {
  prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
}

