return {
  "NakLast/antigravity-cli.nvim",
  cmd = { "AntigravityToggle", "AntigravitySend" },
  keys = {
    { "<leader>ag", "<cmd>AntigravityToggle<cr>", desc = "Alternar Antigravity CLI" },
  },
  opts = {
    cmd = "antigravity-cli", -- Asegúrate de tener instalado el binario en tu PATH
    win = {
      position = "float",
      height = 0.85,
      width = 0.85,
    },
  },
}
