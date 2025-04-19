return {
	"mfussenegger/nvim-dap",

	dependencies = {
		"rcarriga/nvim-dap-ui",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		-- Install js-dubugger manually: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#vscode-js-debug
		-- I extracted it to the ~/dev-tools dir
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = { "/Users/mallet/dev-tools/js-debug/src/dapDebugServer.js", "${port}" },
			},
		}

		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
		}

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dc", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<Leader>do", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<Leader>di", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<Leader>dO", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end)
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end)
	end,
}

-- return {
-- 	"mfussenegger/nvim-dap",
--
-- 	dependencies = {
-- 		-- Add your own debuggers here
-- 		-- lang specific
-- 		-- "leoluz/nvim-dap-go",
--
-- 		-- Creates a beautiful debugger UI
-- 		"rcarriga/nvim-dap-ui",
--
-- 		-- Allows you to see variables in the editor
-- 		"theHamsta/nvim-dap-virtual-text",
--
-- 		-- Required dependency for nvim-dap-ui
-- 		"nvim-neotest/nvim-nio",
--
-- 		-- Installs the debug adapters for you
-- 		"williamboman/mason.nvim",
-- 		"jay-babu/mason-nvim-dap.nvim",
-- 	},
--
-- 	config = function()
-- 		local mason_dap = require("mason-nvim-dap")
-- 		local dap = require("dap")
-- 		local ui = require("dapui")
-- 		local dap_virtual_text = require("nvim-dap-virtual-text")
--
-- 		dap_virtual_text.setup()
--
-- 		mason_dap.setup({
-- 			ensure_installed = { "cppdbg" },
-- 			automatic_installation = true,
-- 			handlers = {
-- 				function(config)
-- 					require("mason-nvim-dap").default_setup(config)
-- 				end,
-- 			},
-- 		})
-- 	end,
-- }
