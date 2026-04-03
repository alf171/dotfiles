local M = {}

function M.setup(plugin_modules)
  local plugins = {}
  local pack_spec = {}

  for _, module_name in ipairs(plugin_modules) do
    local plugin = require(module_name)
    plugins[#plugins + 1] = plugin

    if plugin.pack then
      if plugin.pack.src then
        pack_spec[#pack_spec + 1] = plugin.pack
      else
        vim.list_extend(pack_spec, plugin.pack)
      end
    end
  end

  vim.pack.add(pack_spec, { confirm = false, load = true })

  for _, plugin in ipairs(plugins) do
    if plugin.setup then
      plugin.setup()
    end
  end
end

return M
