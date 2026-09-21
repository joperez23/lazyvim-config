return {
  "mistweaverco/kulala.nvim",
  -- lazy = false means it loads at startup; alternatively, load on filetypes:
  -- ft = { "http", "rest", "javascript", "lua" },
  lazy = false,
  keys = {
    { "<leader>Rr", "<cmd>lua require('kulala').run()<cr>", desc = "Run request under cursor" },
    { "<leader>Ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "Run all requests in file" },
    { "<leader>Rp", "<cmd>KulalaPreview<cr>", desc = "Preview curl command" },
    { "<leader>Rs", "<cmd>KulalaStop<cr>", desc = "Stop running request" },
    { "<leader>Rt", "<cmd>KulalaToggle<cr>", desc = "Toggle response window" },
    { "<leader>Rg", "<cmd>KulalaDownloadSchema<cr>", desc = "Download GraphQL schema" },
    { "<leader>Rj", "<cmd>KulalaCookies<cr>", desc = "Open cookies editor" },
  },
  opts = {
    -- Path to kulala-core executable (auto-detected by default)
    kulala_core = nil,
    -- Override data directory (nil = use defaults below)
    data_dir = nil,
    -- Download URL template for kulala-core releases
    download_url = "https://github.com/mistweaverco/kulala-core/releases/download/%s/%s",
    -- Downloader: "curl", "wget", or full path to either
    downloader = "curl",
    -- Session persistence across restarts
    session = { restore = true },
    -- Tree-sitter parser handling (download, build, install)
    treesitter = { enable = false },
    -- Global keymaps (disabled by default; we define our own above)
    global_keymaps = false,
    -- Kulala UI keymaps inside the response/result buffer
    kulala_keymaps = true,
  },
}

--return {

--  {
--    "mistweaverco/kulala.nvim",
--    keys = {
--      { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request", ft = "http" },
--      { "<leader>Rs", desc = "Send request" },
--      { "<leader>Ra", desc = "Send all requests" },
--      { "<leader>Rb", desc = "Open scratchpad" },
--    },
--    ft = { "http", "rest" },
--    opts = {
--      -- Opciones de configuración aquí
--    },
--  },
--}
