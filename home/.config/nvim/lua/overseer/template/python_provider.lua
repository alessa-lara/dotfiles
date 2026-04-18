---@type overseer.TemplateFileProvider
return {
	generator = function(search)
		local tasks = {}

        if vim.fn.filereadable(search.dir .. "/main.py") then
            table.insert(tasks, {
                name = "Run: main",
                builder = function()
                    return {
                        cmd = { "python", "main.py" },
                        components = { "default", { "on_output_quickfix", open = true } },
                    }
                end,
            })
        end


        local test_files = vim.fn.glob(search.dir .. "/**/*test*.py", false, true)
        for _, file in ipairs(test_files) do
            local rel_path = vim.fn.fnamemodify(file, ":.")
            table.insert(tasks, {
                name = "Test: " .. rel_path,
                builder = function()
                    return {
                        cmd = { "python", rel_path },
                        components = { "default", { "on_output_quickfix", open = true } },
                    }
                end,
            })
        end

		return tasks
	end,
	condition = { filetype = { "python" } },
}
