local opt = vim.opt

-------------------------------------
-- For GUIs like NeoVide
-------------------------------------
-- get # of Active Monitor 
function Get_connected_monitors()
    local result = vim.fn.system('xrandr -q | grep " connected" | wc -l') -- HACK: not on linux? no X open?
    return tonumber(result)
end
-- set display font size 
function Set_font_size()
    local connected_monitors = Get_connected_monitors()

    if connected_monitors > 1 then
        vim.cmd('set guifont=JetBrainsMono\\ Nerd\\ Font:h14')
    else
        vim.cmd('set guifont=JetBrainsMono\\ Nerd\\ Font:h10')
    end
end

-- run the function to set font size at start
Set_font_size()

-- run the function whenever entering/leaving a buffer
vim.cmd('autocmd FocusGained,BufEnter * lua Set_font_size()')
vim.cmd('autocmd FocusLost,BufLeave * lua Set_font_size()')

opt.linespace = -1

-- numbers
opt.relativenumber = true
opt.number = true

-- tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- no wrap except certain filetype
opt.wrap = false
vim.cmd([[
  augroup MarkdownSettings
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal textwidth=80
    autocmd FileType tex setlocal wrap
    autocmd FileType tex setlocal textwidth=80
  augroup END
]])

opt.colorcolumn={80}

-- try to enable cursorline
opt.cursorline = true -- HACK: Conflict with the scheme? idk why not showing

-- use mouse
opt.mouse:append("a")
-- use system clipboard as well
opt.clipboard:append("unnamedplus")

-- enable spliting window/pane
opt.splitright = true
opt.splitbelow = true

-- cmd cases
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true -- NOTE: This is already at the first line in `init.lua`, no real need here
vim.o.background = "dark"

-- I love sign columns
opt.signcolumn = "yes"

-- diagnostic
vim.diagnostic.config{
    underline = false,
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.cmd([[
            highlight Visual guibg=#abb2bf
            highlight Visual gui=reverse
            highlight Visual guibg=#282c34
        ]])
