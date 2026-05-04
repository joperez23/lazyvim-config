return {
  -- Configuración del Servidor de Lenguaje (LSP)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configuración para JavaScript/TypeScript
        vtsls = {
          settings = {
            javascript = {
              suggestionActions = { enabled = true },
              updateImportsOnRename = { enabled = "always" },
            },
          },
        },
        -- Puedes añadir más servidores aquí (pyright, html, etc.)
      },
    },
  },

  -- Extras de LazyVim (Forma recomendada de activar lenguajes)
  -- Esto instala automáticamente herramientas útiles para TS/JS
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
}
