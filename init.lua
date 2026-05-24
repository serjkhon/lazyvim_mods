-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set('n', '\\', ':term python %<CR>')

vim.api.nvim_create_user_command("Lat", function()
local dir = vim.fn.expand("%:p:h")
local file = vim.fn.expand("%:p")
local pdf = vim.fn.expand("%:p:r") .. ".pdf"
vim.fn.jobstart("cd " .. dir .. " && latexmk -pdf " .. file .. " && zathura " .. pdf, {
    detach = true,
})
end, {})
