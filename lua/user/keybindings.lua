vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', {noremap = true, silent= false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent= false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent= false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent= false})

map('n', '<TAB>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
