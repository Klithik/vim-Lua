local on_attach = function(_, bufnr)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
	-- Buffer local mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	--vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

require("neodev").setup()
-- Checking Lua setup LSP
require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			telemetry = { enable = false },
			workspace = { checkThirdParty = false },
		},
	},
})

require("lspconfig").gopls.setup({
    on_attach = on_attach,
    settings = {
        filetypes = {
            "go",
        },
    },
})


-- Python SETUP LSP
require("lspconfig").pyright.setup({
	on_attach = on_attach,
	settings = {
		filetypes = { "python" },
	},
})

require("lspconfig").clangd.setup({
    on_attach = on_attach,
    settings = {
        filetypes = {
            "c",
            "cpp",
            "objc",
            "objcpp",
            "cuda",
            "proto",
        },
    },
})

require("lspconfig").emmet_ls.setup({
	on_attach = on_attach,
	settings = {
		filetypes = {
			"html",
		},
	},
})

require("lspconfig").bacon_ls.setup({
	on_attach = on_attach,
	settings = {
        cmd = { "bacon-ls"},
		filetypes = {
			"rust",
		},
        init_options = {},
        single_file_support = true,
	},
})

require("lspconfig").ast_grep.setup({
	on_attach = on_attach,
	settings = {
		filetypes = {
			"kotlin",
		},
	},
})

require("lspconfig").ts_ls.setup({
	on_attach = on_attach,
	settings = {
        filetypes = {
        "javascript",
        "typescript",
        "vue",
      },
	},
})

--require("lspconfig").denols.setup({
	--on_attach = on_attach,
	--settings = {
		--filetypes = {
			--"javascript",
            --"ts"
		--},
	--},
--})

require("lspconfig").markdown_oxide.setup({
	on_attach = on_attach,
	settings = {
		filetypes = {
			"markdown",
		},
        cmd = {"markdown_oxide"},
	},
})

require("lspconfig").astro.setup({
	on_attach = on_attach,
	settings = {
		filetypes = {
			"astro",
			"Astro",
		},
	},
})

require("lspconfig").nil_ls.setup({
	on_attach = on_attach,
	settings = {
		filetypes = {
			"nil",
		},
	},
})
