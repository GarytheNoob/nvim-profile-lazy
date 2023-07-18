vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
    {from = "jk",   to = "<ESC>",   mode = mode_i},
    {from = "J",   to = ":m '>+1<CR>gv=gv'",   mode = mode_v},
    {from = "K",   to = ":m '<-2<CR>gv=gv'",   mode = mode_v},
    {from = "<C-S>",   to = ":w<CR>"},

    {from = "<leader>sv",   to = "<C-w>v"},
    {from = "<leader>sh",   to = "<C-w>s"},
    
    {from = "<leader>nh",   to = ":nohl<CR>"},
    
    -- nvim-tree
    {from = "<leader>e",   to = ":NvimTreeToggle<CR>"},

    -- buffer
    {from = "<C-S-K>",   to = ":bnext<CR>"},
    {from = "<C-S-J>",   to = ":bprevious<CR>"},
    
    -- hop
    {from = "<leader>f",    to = ":HopPattern<CR>"},

    -- treesitter
    {from = "<leader>ff",   to = require('telescope.builtin').find_files}, 
    {from = "<leader>fg",   to = require('telescope.builtin').live_grep}, 
    {from = "<leader>fb",   to = require('telescope.builtin').buffers}, 
    {from = "<leader>fh",   to = require('telescope.builtin').help_tags}, 

    -- toggleterm
    {from = "<leader>tt",   to = ":ToggleTerm direction=horizontal size=20<CR>"},
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

