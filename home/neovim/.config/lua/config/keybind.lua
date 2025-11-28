-- 將空格設定為全域 leader（在載入其他設定或插件前）
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 基本 keybind（可依需求新增或修改）
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { noremap = true, silent = true, desc = 'Quit' })

vim.keymap.set('n', '<leader>ft', '<cmd>FloatermToggle<CR>', { noremap = true, silent = true, desc = 'Toggle Floaterm' })
-- 新增：<leader>L 打開 :Lazy
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<CR>', { noremap = true, silent = true, desc = 'Open Lazy' })

-- nvim-telescope/telescope.nvim

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })