return {
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup({
        max_length = 0,
        silent = false,
        trim = false,
      })

      local function copy()
        if vim.v.event.operator == "y" then
          -- Tomamos el texto directamente del evento, sin depender del registro "+"
          local text = table.concat(vim.v.event.regcontents, "\n")
          require("osc52").copy(text)
        end
      end

      vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
    end,
  },
}
