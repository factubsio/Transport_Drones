local require = function(name) return require("data/entities/"..name) end

require("transport_refinery/transport_refinery")
require("transport_drone/transport_drone")
require("transport_depot/transport_depot")
