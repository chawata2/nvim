-- Neovim general settings
vim.g.mapleader      = " "
vim.g.maplocalleader = ","
vim.opt.tabstop      = 4
vim.opt.shiftwidth   = 4
vim.opt.expandtab    = true -- タブ文字→スペースへ変換
vim.opt.softtabstop  = 4    -- <Backspace> で 4 文字戻す
vim.opt.mouse        = "a"
vim.opt.title        = true
vim.opt.helplang     = "ja"
vim.opt.visualbell   = true
vim.opt.showmatch    = true
vim.opt.matchtime    = 1
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
-- vim.o.number = true
-- vim.o.relativenumber = true
vim.opt.cursorline = true
vim.o.termguicolors = true
vim.opt.winblend = 0     -- ウィンドウの不透明度
vim.opt.pumblend = 0     -- ポップアップメニューの不透明度

vim.opt.autoread = true  -- 外部変更を検出したら自動で読み直す
vim.opt.updatetime = 200 -- CursorHold が発火しやすいように（デフォ 4000 ms）
vim.api.nvim_create_autocmd(
    { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
    { pattern = "*", command = "checktime" }
)
