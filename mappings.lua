---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- Windows management
    ["ss"] = { ":split<Return><C-w>w", "split horizontally" },
    ["sv"] = { ":vsplit<Return><C-w>w", "split vertically" },
    ["sc"] = { ":close<cr>", "split vertically" },
    ["sj"] = { "<C-w>j", "Move to down window" },
    ["sh"] = { "<C-w>h" },
    ["sl"] = { "<C-w>l" },
    ["sk"] = { "<C-w>k" },
    ["se"] = { "<C-w>=", "Make split equals" },
    ["<Space>"] = { "<C-w>w" },

    -- Windows management
    ['x'] = { '"_x"' }, -- Do not yank with x
    ['+'] = { '<C-a>' }, -- Increment
    ['-'] = { '<C-a>' }, -- Decrement
    ['dw'] = { 'vb"_d' }, -- Delete a word backward
    ['te'] = { ':tabedit<Return>', opts = { silent = true } }
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fc"] = { "<cmd> Telescope flutter commands<CR>", "flutter commands" },
  },
}

-- more keybinds!

return M
