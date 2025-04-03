return {
  -- LSPConfig (Herramienta de Neovim para configurar los servidores LSP)
  "NeoVim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim"
  },
  config = function()
    -- Iniciamos Neodev
    require("neodev")

    -- Iniciamos mason-lspconfig
    require("mason-lspconfig").setup()

    -- Con esta función mapeamos atajos de forma mas cómoda
    local keyn = function(key, act, opt)
      vim.keymap.set("n", key, act, opt)
    end

    -- Primero definimos atajos que no dependen del servidor LSP
    keyn("<leader>d<right>", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, { desc = "Mover a error anterior" })

    keyn("<leader>d<left>", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, { desc = "Mover a error posterior" })

    -- Luego definimos algunos que si dependen del LSP
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
        require("conform").format({ async = true })
      end, { buffer = bufnr, desc = "Formatear texto" })
    end

    -- Utilizaremos esto para inicializar automaticamente todos los servidores LSP
    local lspconfig = require("lspconfig")

    -- Con esto le avisamos algunas capacidades extra que tiene NeoVim por tener instalado CPM-NVIM
    local common_capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Con esta función iniciamos uno por uno los servidores
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        local configs = {
          on_attach = on_attach,
          capabilities = common_capabilities,
        }

        if server_name == "lua_ls" then
          configs = {
            on_attach = on_attach,
            capabilities = common_capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }, -- Evita los warnings sobre "vim" no definido
                }
              }
            }
          }
        end

        lspconfig[server_name].setup(configs)
      end
    })
  end
}
