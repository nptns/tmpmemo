local function open_memo()
    local buf = vim.api.nvim_create_buf(false, true)

    vim.bo[buf].buftype    = "nofile"
    vim.bo[buf].bufhidden  = "wipe"
    vim.bo[buf].swapfile   = false
    vim.bo[buf].modifiable = true

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
        "",
    })
    
    vim.cmd('split')
    vim.api.nvim_set_current_buf(buf)

    vim.keymap.set("n", "<ESC>", function()
        vim.api.nvim_win_close(0, true)
    end, { buffer = buf, silent = true })

    vim.cmd('setfiletype markdown')
end

vim.keymap.set("n", "<leader>m", open_memo, { silent = true })
