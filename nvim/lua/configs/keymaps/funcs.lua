local funcs = {}

funcs.format = function()
  require("conform").format({ async = true })
end

return funcs
