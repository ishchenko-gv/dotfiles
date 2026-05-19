return {
	["gopls"] = {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_marker = { "go.work", "go.mod", ".git" },
		flags = {
			debounce_text_changes = 500,
		},

		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
				ignored = {
					"**/node_modules/**",
					"**/.git/**",
					"**/bazel-out/**",
					"**/vendor/**",
					"**/.cache/**",
				},
			},
		},

		settings = {
			buildFlags = { "-tags=debug" },
			gopls = {
				expandWorkspaceToModule = false,
				staticcheck = false,
				completionBudget = "100ms",
				deepCompletion = false,
				analyses = {
					unusedparams = false,
					shadow = false,
				},
				directoryFilters = {
					"-**/node_modules",
					"-**/.git",
					"-**/bazel-out",
					"-**/vendor",
				},
			},
		},

		diagnosticsDelay = "1s", -- Wait for typing to pause before running compiler checks

		["ui.completion.deepCompletion"] = false,
		["ui.completion.fuzzyMatching"] = false,

		hints = {
			assignVariableTypes = false,
			compositeLiteralFields = false,
			compositeLiteralTypes = false,
			constantValues = false,
			functionTypeParameters = false,
			parameterNames = false,
			rangeVariableTypes = false,
		},
	},
}
