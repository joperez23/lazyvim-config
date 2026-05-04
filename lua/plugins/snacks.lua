return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = function(_, opts)
    -- Mantenemos las opciones que ya existan pero forzamos la desactivación de image
    opts.image = { enabled = false }
    return opts
  end,
}
