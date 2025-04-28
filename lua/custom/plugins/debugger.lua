return {
	"mfussenegger/nvim-dap",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",

		"leoluz/nvim-dap-go",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapvt = require("nvim-dap-virtual-text")

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({
			-- Set icons to characters that are more likely to work in every terminal.
			--    Feel free to remove or use ones that you like more! :)
			--    Don't feel like these are good choices.
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		dapvt.setup({
			commented = false,
			virt_text_pos = "eol",
		})

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

		dap.adapters["pwa-chrome"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = { "/Users/mallet/dev-tools/js-debug/src/dapDebugServer.js", "${port}" },
			},
		}

		for _, language in ipairs({ "typescript", "javascript", "javascriptreact" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},

				-- server side debugging:
				{
					type = "pwa-node",
					-- attach to an already running node process with --inspect flag
					request = "attach",
					name = "Attach debugger to existing `node --inspect` process",
					-- allows us to pick the process using a picker
					-- processId = require("dap.utils").pick_process,
					-- For typescript:
					-- sourceMaps = true,
					-- resolve source maps in nested locations while ignoring node_modules
					-- resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
					port = 9229, -- Default debugging port
					cwd = "${workspaceFolder}",
				},

				-- nextjs debugging: https://stackoverflow.com/questions/78455585/correct-setup-for-debugging-nextjs-app-inside-neovim-with-dap
				-- put in packag.json script: "dev:debug": "NODE_OPTIONS='--inspect=9230' next dev"
				{
					name = "Next.js: debug server-side",
					type = "pwa-node",
					request = "attach",
					port = 9231,
					skipFiles = { "<node_internals>/**", "node_modules/**" },
					cwd = "${workspaceFolder}",
				},

				-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript-chrome
				-- Local debugging
				{
					name = "Next.js: debug client-side",
					type = "pwa-chrome",
					request = "launch",
					url = "http://localhost:3001", -- Matches the port in npm script
					webRoot = "${workspaceFolder}",
					sourceMaps = true,
					skipFiles = { "node_modules/**" },
				},
			}
		end

		-- Install golang specific config
		require("dap-go").setup({
			-- Install delve via homebrew: `brew install delve`
			delve = {
				-- On Windows delve must be run attached or it crashes.
				-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
				detached = vim.fn.has("win32") == 0,
			},
		})

		-- dap.listeners.after.event_initialized["dapui_config"] = function()
		-- 	dapui.open()
		-- end
		-- dap.listeners.before.event_terminated["dapui_config"] = function()
		-- 	dapui.close()
		-- end
		-- dap.listeners.before.event_exited["dapui_config"] = function()
		-- 	dapui.close()
		-- end

		local dapui_open = false

		vim.keymap.set("n", "<Leader>do", function()
			if dapui_open then
				dapui.close()
				dapui_open = false
			else
				dapui.open()
				dapui_open = true
			end
		end, { desc = "Toggle DAP UI" })

		vim.keymap.set("n", "<Leader>dc", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<Leader>o", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<Leader>i", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<Leader>O", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint()
		end)
		-- vim.keymap.set("n", "<Leader>lp", function()
		-- 	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		-- end)
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end)
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end)

		-- Run node --inspect index.js to start the server and then attach:
		-- Can just <Leader>dc to pick the adapter to attach to
		-- vim.keymap.set("n", "<Leader>da", function()
		-- 	dap.run(dap.configurations.javascript[2])
		-- end, { desc = "[A]ttach to running server" })
		--
		-- -- Next.js specific attach (port 9230)
		-- vim.keymap.set("n", "<Leader>dn", function()
		-- 	dap.run(dap.configurations.javascript[3])
		-- end, { desc = "Attach to [N]ext.js server" })
	end,
}
