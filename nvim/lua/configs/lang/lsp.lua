require("lazydev").setup()

local capab = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config["*"] = { capabilities = capab }

require("mason-lspconfig").setup({ automatic_enable = true })

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
  virtual_lines = {
    current_line = true,
  },
  underline = true,
  update_in_insert = false,
})
