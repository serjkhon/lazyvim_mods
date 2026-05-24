require("config.lazy")

vim.keymap.set("n", "\\", ":term python %<CR>")

vim.api.nvim_create_user_command("Lat", function()
local dir = vim.fn.expand("%:p:h")
local file = vim.fn.expand("%:p")
local pdf = vim.fn.expand("%:p:r") .. ".pdf"

local cmd = "cd " .. vim.fn.shellescape(dir)
.. " && latexmk -pdf " .. vim.fn.shellescape(file)
.. "; if [ -f " .. vim.fn.shellescape(pdf) .. " ]; then zathura "
.. vim.fn.shellescape(pdf) .. " & fi"

vim.fn.jobstart(cmd, { detach = true })
end, {})
