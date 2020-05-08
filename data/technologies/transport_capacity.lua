local shared = require("shared")
local name = shared.transport_capacity_technology

local levels =
{
  [1] =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
  },
  [2] =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
  },
  [3] =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
  },
  [4] =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"utility-science-pack", 1},
  },
  [5] =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"utility-science-pack", 1},
  }
}

for k, ingredients in pairs (levels) do

  local technology =
  {
    name = name.."-"..k,
    localised_name = {name},
    type = "technology",
    icon = util.path("data/technologies/transport-capacity-icon.png"),
    icon_size = 128,
    upgrade = true,
    effects =
    {
      {
        type = "nothing",
        effect_description = "Transport drone stack capacity: +1"
      },
    },
    prerequisites = k > 1 and {name.."-"..k - 1} or {"transport-system"},
    unit =
    {
      count = k * 200,
      ingredients = ingredients,
      time = 30
    },
    order = name
  }
  data:extend{technology}
end

