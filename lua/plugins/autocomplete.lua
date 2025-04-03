return {
  {
    "hrsh7th/nvim-cmp", -- Motor de autocompletado
    dependencies = {
      "hrsh7th/cmp-buffer", -- Completa con datos de los buffers
      "hrsh7th/cmp-path", -- Completa rutas a archivos
      "hrsh7th/cmp-nvim-lsp", -- Completa con los LSP
      "hrsh7th/cmp-cmdline", -- Completa comandos
      "hrsh7th/cmp-git", -- Completado en mensajes de git
      "L3MON4D3/LuaSnip", -- Snippets
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs", -- Cierra llaves, corchetes, etc.
    },
    event = "VeryLazy",
    config = function()
      local cmp = require("cmp")
      local ls = require("luasnip")
      local ap = require("nvim-autopairs.completion.cmp")
      cmp.setup({
        -- Motor de snippets (Necesario)
        snippet = {
          expand = function(args)
            ls.lsp_expand(args.body)
          end,
        },

        -- Estilo de las ventanas completado y documentación
        window = {
          completion = { border = "rounded" },
          documentation = { border = "rounded" },
        },

        -- Atajos para cuando está el menu de completado
        mapping = {
          ["<down>"] = cmp.mapping.scroll_docs(-4), -- Scroll para arriba en la doc
          ["<up>"] = cmp.mapping.scroll_docs(4), -- Scroll para abajo en la doc
          ["<esc>"] = cmp.mapping.abort(), -- Cancelar y cerrar menu
          ["<Tab>"] = cmp.mapping(function(fallback) -- Sigiente item
            if cmp.visible() then
              cmp.select_next_item()
            elseif ls.choice_active() then
              ls.change_choice(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Item anterior
          ["<cr>"] = cmp.mapping.confirm({ -- Confirmar
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
          }),
          ["<c-space>"] = cmp.mapping.complete(), -- Abrir menu
        },

        -- Fuentes de autocompletado
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      })

      -- Para que al completar tambien cierre llaves
      cmp.event:on(
        "confirm_done",
        ap.on_confirm_done({
          map_char = { tex = "" },
        })
      )

      -- Para cuando haces un commit y no pones un mensaje
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" },
          { name = "path" },
          { name = "buffer" },
        }),
      })

      -- Para completar al estar buscando algo
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Para completar al pasar un comando
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })
    end,
  },

  -- luasnip
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    event = "InsertEnter",
    config = function()
      local ls = require("luasnip")
      local types = require("luasnip.util.types")
      ls.setup({
        history = true,
        update_events = "TextChanged,TextChangedI",
        delete_check_events = "TextChanged",
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "<- Choice", "Error" } },
            },
          },
        },
      })

      -- Placeholder siguiente
      vim.keymap.set({ "i", "s" }, "<c-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      -- Placeholder anterior
      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      -- Cambiar de nodo
      vim.keymap.set("i", "<c-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)
    end,
  },
}
