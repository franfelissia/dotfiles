require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
    },
    menu = {
      auto_show = true,
    },
    ghost_text = {
      enabled = false,
    },
    signature = {
      enabled = true,
    },
    sources = {
      default = {
        "lsp",
        "buffer",
        "snippets",
        "path",
        "nerdfont",
      },
      providers = {
        nerdfont = {
          module = "blink-nerdfont",
          name = "Nerd Fonts",
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
        },
      },
    },
    snippets = {
      preset = "mini_snippets",
    },
  },
})
