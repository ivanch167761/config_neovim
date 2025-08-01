local function get_python_path()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    local_venv = vim.loop.cwd() .. "/venv/Scripts/python.exe"
  else
    local_venv = vim.loop.cwd() .. "/venv/bin/python"
  end


  if vim.fn.filereadable(local_venv) == 1 then
    return local_venv
  end
  return  vim.g.python3_host_prog
end
-- Load dotenv if available
local function load_dotenv(filepath)
  local env = {}
  for line in io.lines(filepath) do
    for key, value in string.gmatch(line, "([%w_]+)%s*=%s*(.+)") do
      value = value:gsub("^[\"']", ""):gsub("[\"']$", "")
      env[key] = value
    end
  end
  return env
end


local env_path = vim.loop.cwd() .. "/.env"
local env = vim.loop.fs_stat(env_path) and load_dotenv(env_path) or {}
local PROJECT_NAME = env["PROJECT_NAME"] 
local PROJECT_DIRECTORY = vim.loop.cwd()

return {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",
		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
		program = "${file}", -- This configuration will launch the current file if used.
		console = "integratedTerminal", -- Use terminal for input1~
		pythonPath = get_python_path(),
	},
	{
		type = "debugpy",
		request = "launch",
		name = "Django",
		program = PROJECT_DIRECTORY .. "\\manage.py",
		args = {
			"runserver",
		},
		justMyCode = true,
		django = true,
		console = "integratedTerminal",
		pythonPath = get_python_path(),
	},
	{
		type = "python",
		request = "launch",
		name = "Celeryvs",
		module = "celery",
		args = {
			"-A",
			"cfehome",
			"worker",
			"--loglevel",
			"DEBUG",
			"-P",
			"solo",
		},
		justMyCode = true,
		celery = true,
		console = "integratedTerminal",
		pythonPath = get_python_path(),
	},
	{
		type = "python",
		request = "launch",
		name = "Launch file with arguments",
		program = "${file}",
		args = function()
			local args_string = vim.fn.input("Arguments: ")
			return vim.split(args_string, " +")
		end,
		console = "integratedTerminal",
		pythonPath = get_python_path(),
	},
	{
		type = "python",
		request = "launch",
		name = "Launch file with arguments scraping project",
		program = "${file}",
		args = function()
			local args_string = vim.fn.input("Arguments: ")
			return vim.split(args_string, " +")
		end,
		console = "integratedTerminal",
		pythonPath = get_python_path(),
	},
	{
		type = "python",
		request = "launch",
		name = "Launch file SCRAPY",
		program = "${file}",
		console = "integratedTerminal",
		pythonPath = get_python_path(),
	},
	{
		type = "python",
		request = "launch",
		name = "RUN SPYDER",
		program = PROJECT_DIRECTORY .. "/ONLY_COURSES/realpython/executerWithDebugger.py",
		justMyCode = true,
		console = "integratedTerminal",
		pythonPath = get_python_path(),
	},
}
