require("which-key").add({
  -- PlatformIO
  { "<leader>p", group = "PlatformIO", icon = "" },
  { "<leader>pi", "<cmd>Pioinit<cr>", desc = "1. Init", icon = "", mode = "n" },
  { "<leader>pb", "<cmd>Piorun build<cr>", desc = "2. Build", icon = "󰯯", mode = "n" },
  { "<leader>pr", "<cmd>Piorun<cr>", desc = "3. Build & run", icon = "", mode = "n" },
  { "<leader>pl", "<cmd>Piolib<cr>", desc = "4. Install Lib", icon = "", mode = "n" },
  { "<leader>pm", "<cmd>Piomon<cr>", desc = "5. Serial Monitor (9600bd)", icon = "󰍹", mode = "n" },
  { "<leader>t", "<cmd>Neotree focus<cr>", desc = "Show/hide Neotree", icon = "", mode = "n" },
  { "<leader>n", "<cmd>enew<cr><cmd>lua require('mini.starter').open()<cr>", desc = "New buffer", mode = "n" },
})
