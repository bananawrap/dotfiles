-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

local keyset = vim.keymap.set

local map = vim.api.nvim_set_keymap

-- Terminal
keyset("t", "<Esc>", "<C-\\><C-n>", { silent = true })
keyset("t", "<C-w>", "<C-\\><C-n><leader>bd<C-w>q", { silent = true })
map("n", "<cs-I>", "<cmd>edit term://fish<cr>", { desc = "open fish" })
map("n", "<C-\\>", "<cmd>vsplit | edit term://fish<CR>", { desc = "open fish vertically" })
map("n", "<c-i>", "<cmd>split | edit term://fish<CR>", { desc = "open fish horizontally", noremap = true })
map("n", "<leader>e", "<cmd>Ex<cr>", { desc = "open Ex" })
map("n", "gw", "*", { desc = "search for word under cursor" })

-- Harpoon
wk.register({
  h = {
    name = "harpoon",
  },
}, { prefix = "<leader>" })

map("n", "<A-1>", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', { desc = "harpoon nav to 1st" })
map("n", "<A-2>", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', { desc = "harpoon nav to 2nd" })
map("n", "<A-3>", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', { desc = "harpoon nav to 3rd" })
map("n", "<A-4>", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', { desc = "harpoon nav to 4th" })
map("n", "<A-h>", '<cmd>:lua require("harpoon.ui").nav_prev()<cr>', { desc = "harpoon previous" })
map("n", "<A-l>", '<cmd>:lua require("harpoon.ui").nav_next()<cr>', { desc = "harpoon next" })
map("n", "<leader>hm", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', { desc = "quick menu" })
map("n", "<leader>ha", '<cmd>lua require("harpoon.mark").add_file()<cr>', { desc = "add" })

-- Transparent
wk.register({
  t = {
    name = "transparent",
  },
}, { prefix = "<leader>" })

map("n", "<leader>tt", "<cmd>TransparentToggle<cr>", { desc = "toggle transparency" })
