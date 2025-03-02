return {
  "rebelot/kanagawa.nvim",
  lazy = false,      -- Esto es para que no se cargue de forma asincrona, sino que vaya con el inicio de nvim.
  priority = 1000,   -- Dentro de los plugins que se cargan al iniciar nvim, se le asigna un priorirdad.
  config = function()
    -- Con esto le indicamos que cargue el esquema de colores
    vim.cmd([[colorscheme kanagawa]])
  end,
}
