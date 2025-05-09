local wk = require("which-key")
local funcs = require("configs.keymaps.funcs")

return function(_, bufnr)
  wk.add({
    { "<leader>l", group = "LSP Tools" },
    { "<leader>lh", vim.lsp.buf.hover, { buffer = bufnr }, desc = "Hover", mode = "n" },
    { "<leader>ld", vim.lsp.buf.declaration, { buffer = bufnr }, desc = "Declaration", mode = "n" },
    { "<leader>lD", vim.lsp.buf.definition, { buffer = bufnr }, desc = "Definition", mode = "n" },
    { "<leader>li", vim.lsp.buf.implementation, { buffer = bufnr }, desc = "Implementation", mode = "n" },
    { "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr }, desc = "Signature Help", mode = "n" },
    { "<leader>lc", vim.lsp.buf.code_action, { buffer = bufnr }, desc = "Code actions", mode = "n" },
    { "<leader>lr", vim.lsp.buf.references, { buffer = bufnr }, desc = "Referencies", mode = "n" },
    { "<leader>f", funcs.format, { buffer = bufnr }, desc = "Format", mode = "n" },
  })
end
