return {
  -- Instalamos lspconfig
  "neovim/nvim-lspconfig",

  -- Declaramos los plugins de los que depende
  -- para que los instale y los inicie ante de lspconfig
  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim"
  },

  -- Configuramos lspconfig y sus dependencias
  config = function()
    -- Con esta funcion crearemos atajos de teclado para el modo normal
    local keyn = function(key, act, opt)
      vim.keymap.set("n", key, act, opt)
    end

    -- Priero definimos unos atajos que no dependen del servidor lsp
    keyn("<leader>d<right>", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, {desc = "Mover a error anterior"})
    keyn("<leader>d<left>", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, {desc = "Mover a error posterior"})

    -- Luego definimos algunos que si dependen del lsp
    local on_attach = function(_, bufnr)
      -- Con esto podemos tener un autocompletado básico
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

      keyn("<leader>lh", vim.lsp.buf.hover, { buffer = bufnr, desc = "Cabecera" })
      keyn("<leader>ld", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaración" })
      keyn("<leader>lD", vim.lsp.buf.definition, { buffer = bufnr, desc = "Definición" })
      keyn("<leader>li", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementación" })
      keyn("<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Documentación" })
      keyn("<leader>lc", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code actions" })
      keyn("<leader>lr", vim.lsp.buf.references, { buffer = bufnr, desc = "Referencias" })
      keyn("<leader>f", function()
        vim.lsp.buf.format({ bufnr = bufnr, async = true })
      end, { buffer = bufnr, desc = "Formatear texto" })
    end

    -- Iniciamos neodev
    require("neodev").setup()

    -- Iniciamos cada servidor y le asignamos los atajos de teclado
    require("lspconfig").lua_ls.setup({ on_attach = on_attach })
    require("lspconfig").arduino_language_server.setup({ on_attach = on_attach })
    require("lspconfig").pylsp.setup({ on_attach = on_attach })
    require("lspconfig").clangd.setup({ on_attach = on_attach })

    -- Hacemos un chequeo de que lspconfig esté funcionando
    require("lspconfig.health").check()
  end,
}
