return {
  name = 'Run CMake',
  params = {
    exe_name = {
      type = 'string',
      name = 'Executable Name',
      desc = 'Name of the binary to run after build (no path)',
      default = '',
    },
  },
  builder = function(params)
    return {
      cmd = {
        'bash',
        '-c',
        string.format(
          [[
			mkdir -p build &&
			cd build &&
			cmake .. &&
			make &&
			./%s
			]],
          params.exe_name
        ),
      },
      components = { 'default' },
    }
  end,
}
