local M = {
  config = {
    loaded = {}, ---@type table<string, boolean>
  }
}

--- @class PluginModule
--- @field pack? vim.pack.Spec|vim.pack.Spec[]
--- @field setup? fun()
--- @field ft? string|string[]

--- @param module_name string
--- @param plugin PluginModule
function M.load_plugin(module_name, plugin)
  if M.config.loaded[module_name] then
    return
  end
  M.config.loaded[module_name] = true

  if plugin.pack then
    local spec = plugin.pack.src and { plugin.pack } or plugin.pack
    vim.pack.add(spec, { confirm = false, load = true })
  end

  if plugin.setup then
    plugin.setup()
  end
end

--- @param plugin_modules string[]
function M.setup(plugin_modules)
  for _, module_name in ipairs(plugin_modules) do
    local plugin = require(module_name) --- @type PluginModule

    if plugin.ft then
      vim.api.nvim_create_autocmd('FileType', {
        pattern = plugin.ft,
        callback = function ()
          M.load_plugin(module_name, plugin)
        end
      })
    else
      M.load_plugin(module_name, plugin)
    end
  end
end

return M
