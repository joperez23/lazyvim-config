return {
  {
    "ojroques/nvim-osc52",
    config = function()
      -- Configuración básica
      require("osc52").setup({
        max_length = 0, -- Sin límite de longitud
        silent = false, -- Queremos ver si falla
        trim = false,
      })

      -- Esta función detecta cuando haces "yank" (y)
      local function copy()
        if vim.v.event.operator == "y" and vim.v.event.regname == "" then
          require("osc52").copy_register("+")
        end
      end

      -- Auto-comando para disparar la copia automáticamente
      vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
    end,
  },
}
