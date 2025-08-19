return {
 cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = function(fname)
        -- Use standard LSP root detection for Go
        return util.root_pattern("go.work", "go.mod", ".git")(fname) or vim.fn.getcwd()
    end,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
}
