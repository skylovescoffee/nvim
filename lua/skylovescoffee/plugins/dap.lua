return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")
            local dap_virtual_text = require("nvim-dap-virtual-text")

            -- Debugger stays in a dedicated tooling virtualenv
            dap_python.setup(vim.fn.expand("~/.virtualenvs/debugpy/bin/python"))

            -- Breakpoint signs: red dot for a plain breakpoint
            vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#f7768e" })
            vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e0af68" })
            vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#7aa2f7" })
            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
            vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition" })
            vim.fn.sign_define("DapLogPoint", { text = "●", texthl = "DapLogPoint" })

            dapui.setup()

            dap_virtual_text.setup()

            -- Automatically open and close the dap-ui panels around a session
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Keybindings
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: continue / start" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: step over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: step into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: step out" })

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })
            vim.keymap.set("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "DAP: set conditional breakpoint" })
            vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP: terminate session" })
            vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP: run last session" })
            vim.keymap.set("n", "<leader>dh", function()
                dap.ui.widgets.hover()
            end, { desc = "DAP: hover variable value" })
            vim.keymap.set("n", "<leader>du", function()
                dapui.toggle()
            end, { desc = "DAP: toggle UI" })
            vim.keymap.set("n", "<leader>dr", function()
                dap.repl.open()
            end, { desc = "DAP: open REPL" })
        end,
    },
}