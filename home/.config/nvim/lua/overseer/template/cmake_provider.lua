---@type overseer.TemplateFileProvider
return {
	generator = function(search)
		local tasks = {}

		local cmake_file = vim.fs.find("CMakeLists.txt", { upward = true, path = search.dir })[1]
		if not cmake_file then
			return
		end
		local root = vim.fs.dirname(cmake_file)

		local cmd = "cmake --build " .. root .. "/build/ --target help "
		cmd = cmd .. "| grep '\\.\\.\\.' "
		cmd = cmd .. "| awk -F ' ' '{print $2}' "
		cmd = cmd .. "| grep -vE 'all|clean|depend|edit_cache|rebuild_cache|.*\\.o|.*\\.i|.*\\.s'"

		local output = vim.fn.system(cmd)

		print(search.dir)
		if vim.v.shell_error ~= 0 then
			return
		end

		for line in string.gmatch(output, "[^\r\n]+") do
			table.insert(tasks, {
				name = line,
				builder = function()
					return {
						cmd = {
							"cmake",
							"--build",
							root .. "/build/",
							"--target",
							line,
						},
						components = { "default", { "on_output_quickfix", open = true } },
					}
				end,
			})
		end

		table.insert(tasks, {
			name = "Generate CMake",
			builder = function()
				return {
					cmd = {
						"cmake",
						root .. "/build/",
					},
					components = { "default", { "on_output_quickfix", open = true } },
				}
			end,
		})

		return tasks
	end,
	condition = { filetype = { "cpp", "c" } },
}
