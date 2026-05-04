return {
  {
    "mistweaverco/kulala.nvim",
    opts = {},
    keys = {
      {
        "<leader>Rr",
        function()
          require("kulala").run()
        end,
        desc = "Ejecutar petición HTTP",
      },
      {
        "<leader>Rt",
        function()
          require("kulala").toggle_view()
        end,
        desc = "Cambiar vista (Body/Headers)",
      },
      {
        "<leader>Rn",
        function()
          require("kulala").jump_next()
        end,
        desc = "Siguiente petición",
      },
      {
        "<leader>Rp",
        function()
          require("kulala").jump_prev()
        end,
        desc = "Petición anterior",
      },
    },
  },
}
