vim.api.nvim_create_user_command('SendTerminalText',
    function()
        local bufn = vim.api.nvim_get_current_buf()
        -- 0-based index, but end is exclusive.
        local start_row = vim.api.nvim_buf_get_mark(0, "<")[1] - 1
        local end_row = vim.api.nvim_buf_get_mark(0, ">")[1]
        local content = vim.api.nvim_buf_get_lines(bufn, start_row, end_row, false)
        local output = table.concat(content, "\n")
        local command = "tango_tmp=$(cat <<SETVAR\n" .. output .. "\nSETVAR\n)\n" .. 'tmux send-keys -t tango "$tango_tmp" ENTER'
        os.execute(command)
    end,
    {}
)

vim.keymap.set("v", "<leader>ta", "<cmd>SendTerminalText<CR>")
