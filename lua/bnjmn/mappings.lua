-- bnjmn keymaps

-- Window Movement Mappings - Make switching windoes easier
vim.keymap.set('n', '<C-h>', '<C-w>h', {noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {noremap = true})

-- Terminal mappings for easier navigation using vim.keymap.set
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', {noremap = true})
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', {noremap = true})
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', {noremap = true})
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', {noremap = true})

-- Toggle settings

local function vim_norm_opt_toggle(key, opt, on, off, desc)
  vim.keymap.set('n', key, function()
    local state = vim.opt[opt]:get() == off and on or off
    vim.opt[opt] = state
    local message = desc .. (state == on and " Enabled" or " Disabled")
    vim.notify(message)
  end, { desc = "toggle " .. desc })
end

vim_norm_opt_toggle('<leader>th', 'hlsearch', true, false, 'Highlight Search')
vim_norm_opt_toggle('<leader>tl', 'list', true, false, 'List Characters')
vim_norm_opt_toggle('<leader>tn', 'number', true, false, 'Line Numbers')
vim_norm_opt_toggle('<leader>tp', 'paste', true, false, 'Paste Mode')
vim_norm_opt_toggle('<leader>tw', 'wrap', true, false, 'Wrap')
vim_norm_opt_toggle('<leader>tsp', 'spell', true, false, 'Spell Checker')

-- Resize window height
vim.keymap.set('n', '+', function()
  vim.cmd('resize ' .. math.floor(vim.fn.winheight(0) * 10 / 9))
end, {silent = true})

vim.keymap.set('n', '-', function()
  vim.cmd('resize ' .. math.floor(vim.fn.winheight(0) * 9 / 10))
end, {silent = true})

-- Resize window width
vim.keymap.set('n', '<C-w>>', function()
  vim.cmd('vertical resize ' .. math.floor(vim.fn.winwidth(0) * 10 / 9))
end, {silent = true})
vim.keymap.set('n', '<C-w><', function()
  vim.cmd('vertical resize ' .. math.floor(vim.fn.winwidth(0) * 9 / 10))
end, {silent = true})
-- Toggle Fixed Window Size
vim.keymap.set('n', '<leader>tfw', function()
  vim.wo.winfixheight = not vim.wo.winfixheight
  vim.wo.winfixwidth = not vim.wo.winfixwidth
  local message = "Window height fix: " .. (vim.wo.winfixheight and "enabled" or "disabled") ..
                  ", Window width fix: " .. (vim.wo.winfixwidth and "enabled" or "disabled")
  vim.notify(message)
end, {desc = "Toggle Fixed Window Height/Width"})

-- ColorColumn - to warn about line lengths getting out of control
vim.wo.colorcolumn = ""
-- Define the highlight for ColorColumn
vim.cmd([[highlight ColorColumn ctermbg=NONE guibg=#335555]])
local function toggle_colorcolumn()
  if vim.wo.colorcolumn == "" then
    -- Retrieve the textwidth dynamically from the buffer options
    local cc_val = tostring(vim.bo.textwidth + 1)
    vim.wo.colorcolumn = cc_val
    vim.notify("ColorColumn Enabled at: " .. cc_val)
  else
    vim.wo.colorcolumn = ""
    vim.notify("ColorColumn Disabled")
  end
end
vim.keymap.set('n', '<leader>tc', toggle_colorcolumn, {desc = "toggle ColorColumn"})
