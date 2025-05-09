-- Primero buscamos la variable con los archivos donde nvim busca la configuración,
-- lo guardamos en la variable lazypath y le sumamos el archivo de lazy.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Luego verificamos que el directorio de lazy exista, si no existe...
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- ... le decimos al sistema que clone el repo con git.
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  -- Si ocurre algun error lanza un mensaje.
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Finalmente agregamos el archivo de lazy al runtime.
vim.opt.rtp:prepend(lazypath)

-- Iniciamos lazy.
require("lazy").setup({
  -- Con spec de decimos de donde sacar los plugins que debe instalar y como deben configurarse.
  spec = { import = "plugins" },
  -- Que busque automaticamente actualizaciones.
  checker = { enabled = true },
})
