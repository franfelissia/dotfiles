vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.o.wrap = false

vim.opt.showtabline = 1

vim.opt.list = true -- Habilita que los caracteres especiales sean visibles
vim.opt.listchars = {
  tab = '⇄ ',     -- Tabs se muestran como "" (necesita espacio después)
  trail = '',    -- espacios al final de la linea como ""
  lead = '•',     -- Espacios al inicio de linea como "•"
  nbsp = '␣',     -- Espacios no separables como "␣"
  extends = '',  -- Líneas extendidas a la derecha (scroll horizontal)
  precedes = '', -- Líneas extendidas a la izquierda
  eol = '↲',      -- Final de linea
}
