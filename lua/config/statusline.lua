require'nvim-web-devicons'.setup {}

-- groups
vim.cmd("highlight StatusLineMode guifg=#FFFFFF guibg=#808080")
vim.cmd("highlight StatusLineFiletype guifg=#414373 guibg=#242426")
vim.cmd("highlight StatusLinePath guifg=#FFFFFF guibg=#242426")
vim.cmd("highlight StatusLinePosition guifg=#FFFFFF guibg=#242426")

-- icon archivo
local function get_file_icon()
  local icon = require'nvim-web-devicons'.get_icon_by_filetype(vim.o.filetype)
  if icon == nil then
    icon = " " -- icono por defecto
  end
  return icon
end

local modes = {
  n = 'Normal', -- Normal
  i = 'Insert', -- Insert 
  c = 'Command', -- Command
}

_G.get_mode = function()
  local mode = vim.fn.mode()
  local mode_text = modes[mode] or mode
  local padding = "  "
  return padding .. mode_text
end


vim.o.statusline = "%#StatusLineMode#%{v:lua.get_mode()} "
vim.o.statusline = vim.o.statusline .. "%#StatusLineFiletype# " .. get_file_icon() .. " "
vim.o.statusline = vim.o.statusline .. "%#StatusLinePath#%t   "
vim.o.statusline = vim.o.statusline .. "%=  "
vim.o.statusline = vim.o.statusline .. "%#StatusLinePosition#%l:%c "
