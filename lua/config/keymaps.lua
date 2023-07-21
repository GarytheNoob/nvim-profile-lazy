vim.g.mapleader = " "

local function toggle_term()
    local current_file_directory = vim.fn.expand("%:p:h")
    local term_command = string.format("ToggleTerm direction=horizontal size=20 cwd=%s", vim.fn.shellescape(current_file_directory))
    vim.cmd(term_command)
end

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
    {from = "jk",   to = "<ESC>",   mode = mode_i},
    {from = "J",   to = ":m '>+1<CR>gv=gv'",   mode = mode_v},
    {from = "K",   to = ":m '<-2<CR>gv=gv'",   mode = mode_v},
    {from = "<C-S>",   to = ":w<CR>"},
    {from = "<C-Q>",   to = ":qa<CR>"},

    {from = "<leader>sv",   to = "<C-w>v"},
    {from = "<leader>sh",   to = "<C-w>s"},

    {from = "<leader>nh",   to = vim.cmd.nohl},

    -- nvim-tree
    {from = "<leader>e",   to = vim.cmd.NvimTreeToggle},

    -- buffer
    {from = "<leader>K",   to = vim.cmd.bnext},
    {from = "<leader>J",   to = vim.cmd.bprev},

    -- hop
    {from = "<leader>f",    to = vim.cmd.HopPattern},

    -- treesitter
    {from = "<leader>ff",   to = require('telescope.builtin').find_files},
    {from = "<leader>fg",   to = require('telescope.builtin').live_grep},
    {from = "<leader>fb",   to = require('telescope.builtin').buffers},
    {from = "<leader>fh",   to = require('telescope.builtin').help_tags},

    -- toggleterm
    {from = "<leader>tt",   to = toggle_term},

    -- display greeting screeen
    {from = "<leader>grt",   to = vim.cmd.Alpha},

}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
