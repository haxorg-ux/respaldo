require'nvim-web-devicons'.setup {}

-- groups
vim.cmd("highlight StatusLineMode guifg=#1e222a guibg=#abb2bf")
vim.cmd("highlight StatusLineSep guifg=#242426 guibg=#abb2bf")
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

local mode_icons = {
  n = " ",
  i = " ",
  c = " ",
}

local modes = {
  n = 'Normal', -- Normal
  i = 'Insert', -- Insert 
  c = 'Command', -- Command
}

_G.get_mode = function()
  local mode = vim.fn.mode()
  local mode_icon = mode_icons[mode] or ""
  local mode_text = modes[mode] or mode
  local padding = " "
  return padding .. " " .. mode_icon .. mode_text
end


vim.o.statusline = "%#StatusLineMode#%{v:lua.get_mode()} "
vim.o.statusline = vim.o.statusline .. "%#StatusLineSep#"
vim.o.statusline = vim.o.statusline .. "%#StatusLineFiletype# " .. get_file_icon() .. " "
vim.o.statusline = vim.o.statusline .. "%#StatusLinePath#%t   "
vim.o.statusline = vim.o.statusline .. "%=  "
vim.o.statusline = vim.o.statusline .. "%#StatusLinePosition#%l:%c "
