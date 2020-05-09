local shared = require("shared")

local name = shared.transport_system_technology



local transport_system =

{
  name = name,
  localised_name = {name},
  type = "technology",
  icon = util.path("data/technologies/transport-system.png"),
  icon_size = 256,
  upgrade = true,
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "transport-drone"
    },
    {
      type = "unlock-recipe",
      recipe = "request-depot"
    },
    {
      type = "unlock-recipe",
      recipe = "supply-depot"
    },
    {
      type = "unlock-recipe",
      recipe = "fuel-depot"
    },
    {
      type = "unlock-recipe",
      recipe = "fluid-depot"
    },
    {
      type = "unlock-recipe",
      recipe = "buffer-depot"
    },
    {
      type = "unlock-recipe",
      recipe = "transport-drone-refinery"
    },
    {
      type = "unlock-recipe",
      recipe = "drone-fuel-from-coal"
    },
    {
      type = "unlock-recipe",
      recipe = "road"
    }
  },
  prerequisites = nil,
  unit =
  {
    count = 25,
    ingredients =
    {
      {"automation-science-pack", 1},
    },
    time = 10
  },
  order = name,
}
data:extend{transport_system}