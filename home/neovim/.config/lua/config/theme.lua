-- 嘗試依序套用常見的 colorscheme（若 plugin 已安裝則會成功）
local candidates = { "catppuccin", "gruvbox", "tokyonight", "onedark", "gruvbox-material" }

for _, name in ipairs(candidates) do
  local ok = pcall(vim.cmd, "colorscheme " .. name)
  if ok then
    return
  end
end

-- fallback：若都沒安裝則使用內建 default（並設定 background）
vim.o.background = "dark"
pcall(vim.cmd, "colorscheme default")
