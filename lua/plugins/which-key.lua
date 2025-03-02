return {
  "folke/which-key.nvim",
  dependencies = {},
  event = "VeryLazy",
  opts = {
    plugins = {
      presets = {
        operators = true,
        test_objects = true
      }
    }
  },
  config = function()
    require("which-key").setup({})
    require("which-key").add(
      { -- Telescope
        mode = { "n" },
        { "<leader>t", group = "Telescope" },
        { "<leader>tn", ":Telescope file_browser<cr>", desc = "Navegador de archivos", icon = "" },
        { "<leader>tf", ":Telescope find_files<cr>", desc = "Buscador de archivos", icon = "󰈞" },
        {
          "<leader>tp",
          function()
            require("telescope.builtin").find_files({
              prompt_title = "Plugins",
              cwd = vim.fn.stdpath("config") .. "/lua/plugins",
              attach_mappings = function(_, map)
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")
                map("i", "<c-y>", function(prompt_bufnr)
                  local new_plugin = action_state.get_current_line()
                  actions.close(prompt_bufnr)
                  vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
                end)
                return true
              end
            })
          end,
          desc = "Archivos de plugins",
          icon = ""
        },
        { "<leader>tb", ":Telescope buffers<cr>", desc = "Listado de Buffers", icon = "" },
        { "<leader>th", ":Telescope help_tags<cr>", desc = "Manual de uso", icon = "" },
        -- Git
        { "<leader>g", group = "Git" },
        { "<leader>gs", ":Telescope git_status<cr>", desc = "Status" },
        { "<leader>gb", ":Telescope git_branches<cr>", desc = "Branches", icon = "" },
        { "<leader>gc", ":Telescope git_commits<cr>", desc = "Commits", icon = "" },
        { "<leader>gB", ":Telescope git_bcommits<cr>", desc = "Commits del buffer", icon = "" },
        { "<leader>gf", ":Git fetch --all -p<cr>", desc = "Fetch", icon = "" },
        { "<leader>gp", ":Git pull<cr>", desc = "Pull", icon = "" },
        -- Ventanas
        { "<leader>v", "<C-w>v<C-w>l:Telescope file_browser<cr>", desc = "Corte vertical", icon = "󰃒" },
        { "<leader>h", "<C-w>s<C-w>j:Telescope file_browser<cr>", desc = "Corte horizontal", icon = "󰃊" },
        { "<leader>3", "<C-w>v<C-w>l<C-w>s<C-w>h", desc = "Divide la ventana en 3" },
        { "<leader>T", "<C-w>s<C-w>j:terminal<cr>i", desc = "Terminal", icon = "" },
        -- Config y plugins
        { "<leader>c", group = "Configuración y plugins" },
        { "<leader>cr", ":source %<cr>", desc = "Recargar configuración", icon = "" },
        { "<leader>cl", ":Lazy<cr>", desc = "Abrir Lazy.nvim", icon = "󰒲" },
        { "<leader>cu", ":Lazy update<cr>", desc = "Actualizar plugins", icon = "󰒲" },
        { "<leader>cc", ":Lazy health<cr>", desc = "Chequeo de plugins", icon = "󰒲" },
        -- PlatformIO
        { "<leader>p", group = "PlatformIO", icon = "" },
        { "<leader>pi", ":Pioinit<cr>", desc = "Nuevo proyecto", icon = "" },
        { "<leader>pr", ":Piorun<cr>", desc = "Compilar y correr", icon = "" },
        { "<leader>pb", ":Piorun build<cr>", desc = "Compilar", icon = "󰯯" },
        { "<leader>pl", ":Piolib", desc = "Instalar una libreria", icon = "" },
        { "<leader>pm", ":Piomon", desc = "Monitor (9600bd)", icon = "󰍹" },
        -- Buffers
        { "<leader>b", group = "Buffers" },
        { "<leader>b<right>", ":bnext<cr>", desc = "Buffer siguiente" },
        { "<leader>b<left>", ":bprevieus<cr>", desc = "Buffer anterior" },
        { "<leader>bc", ":bd<cr>", desc = "Cerrar buffer" },
        -- Tabs
        { "<leader>P", group = "Pestañas" },
        { "<leader>Pn", ":tabnew<cr>", desc = "Nueva pestaña" },
        { "<leader>P<right>", ":tabnext<cr>", desc = "Pestaña siguiente" },
        { "<leader>P<left>", ":tabprevious<cr>", desc = "Pestaña anterior" },
        -- Extras
        { "<leader>l", group = "Herramientas de lenguaje" },
        { "<leader>d", group = "Diagnóstico" }
      }
    )
  end
}
