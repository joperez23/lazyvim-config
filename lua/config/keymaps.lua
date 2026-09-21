-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "t" }, "<leader>ag", function()
  Snacks.terminal.toggle("agy --model gemini-3.7-flash --effort high")
end, { desc = "Toggle Antigravity CLI (agy)" })

-- Envía las líneas seleccionadas al prompt de Antigravity
local function send_selection_to_agy()
  -- 1. Capturar las líneas visualmente seleccionadas
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local filetype = vim.bo.filetype
  local code = table.concat(lines, "\n")

  -- 2. Pedir instrucción mediante Snacks.input
  Snacks.input({
    prompt = "Instrucción para Antigravity: ",
  }, function(prompt)
    if not prompt or vim.trim(prompt) == "" then
      return
    end

    -- Formatear mensaje con contexto de código
    local message = string.format("%s\n\n```%s\n%s\n```\n", prompt, filetype, code)

    -- 3. Abrir o recuperar la terminal de Snacks con el comando exacto
    local cmd = "agy --model gemini-3.8-flash --effort high"
    local term = Snacks.terminal.get(cmd)

    if not term or not term:buf_valid() then
      term = Snacks.terminal.open(cmd)
    else
      term:show()
    end

    -- 4. Enviar el texto al canal del proceso de la terminal
    local chan = vim.bo[term.buf].channel
    if chan and chan > 0 then
      vim.fn.chansend(chan, message)
    else
      vim.notify("No se pudo obtener el canal de la terminal agy", vim.log.levels.ERROR)
    end
  end)
end

-- Keymap para modo visual ('x')
vim.keymap.set("x", "<leader>as", send_selection_to_agy, {
  desc = "Enviar selección a Antigravity (agy)",
})
