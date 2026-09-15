return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	callback = function(args)
		--		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- 		if not client then
		-- 			return
		-- 		end
		--
		-- 		if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
		-- 		end
		-- 	end,
		-- })
	end,
}
