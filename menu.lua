-- menu para buscar abrir y guardar archivos
-- :lua require('menu').show_menu()  ingresar en linea de comando para abrir el menu.
local M = {}

M.items = {
  { 'Open File', ':e ' },
  { 'Save File', ':w' },
  { 'Close File', ':q' },
}

function M.show_menu()
  local options = {}
  for _, item in ipairs(M.items) do
    table.insert(options, item[1])
  end


  vim.ui.select(options, {
    prompt = 'Selecciona una opción:',
  }, function(choice)
    if choice then
      for _, item in ipairs(M.items) do
        if item[1] == choice then
          if choice == 'Open File' then
            local file = vim.fn.input("Enter file name: ", "", "file")
            vim.cmd(item[2] .. file)
          else
            vim.cmd(item[2])
          end
        end
      end
    else
      print("No option selected")
    end
  end)
end

return M
