return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local diffview = require("diffview")

        diffview.setup({})

        -- Open diff for current file against HEAD
        vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview: Open diff" })

        -- Diff against a specific branch or commit (prompts for input)
        vim.keymap.set("n", "<leader>gD", function()
            local target = vim.fn.input("Diff against: ")
            if target ~= "" then
                vim.cmd("DiffviewOpen " .. target)
            end
        end, { desc = "Diffview: Diff against branch/commit" })

        -- View file history for the current file
        vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview: File history" })

        -- View full repo git log/history
        vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview: Repo history" })

        -- Close diffview
        vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Diffview: Close" })
    end,
}
