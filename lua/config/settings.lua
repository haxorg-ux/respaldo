local map = vim.keymap.set

vim.o.number = true
vim.g.mapleader = " "

map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

map("n", "<C-m>", function()
  require('menu').show_menu()
end)
