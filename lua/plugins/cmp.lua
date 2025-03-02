return {
  -- Motor de autocompletado
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- Para que pueda leer los numeros de buffers
    "hrsh7th/cmp-buffer",
    -- Para poder autocompletar rutas
    "hrsh7th/cmp-path",
    -- Para poder usar servidores LSP como fuentes
    "hrsh7th/cmp-nvim-lsp",
    -- Para poder hacer autocompletado de la linea de comandos
    "hrsh7th/cmp-cmdline",
    -- Para poder hacer autocompletado de git
    "hrsh7th/cmp-git",
    -- Para poder usar snipets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- Para el cierre de llaves, corchetes, etc.
    "windwp/nvim-autopairs",
  },
  event = "VeryLazy",
  -- Con esto se delega la configuración al archivo ../config/plugins/cmp.lua
  main = "config.plugins.cmp",
  config = true,
}
