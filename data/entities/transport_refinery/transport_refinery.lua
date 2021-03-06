

local name = "transport-drone-refinery"

local stone_furnace = data.raw["furnace"]["stone-furnace"]

local drone_refining_category =
{
  type = "recipe-category",
  name = "drone-fuel-refining",
  order = "z[drone-fuel-refining]"
}

local drone_fuel_subgroup =
{
  type = "item-subgroup",
  group = "intermediate-products",
  name = "drone-fuel",
  localised_name = {"drone-fuel-subgroup"},
  localised_description = {"drone-fuel-subgroup-description"},
}

local drone_refinery = util.copy(stone_furnace)
drone_refinery.name = name
drone_refinery.localised_name = {name}
drone_refinery.type = "assembling-machine"
drone_refinery.crafting_categories = {"drone-fuel-refining"}
drone_refinery.rotatable = false
drone_refinery.next_upgrade = nil
drone_refinery.fast_replaceable_group = nil
drone_refinery.selection_box = {{-1, -1}, {1, 1}}
drone_refinery.animation = {
    north = {
        filename = util.path("data/entities/transport_refinery/drone_refinery0001.png"),
        frame_count = 1,
        size = 256,
        scale = .5,
    },
    east = {
        filename = util.path("data/entities/transport_refinery/drone_refinery0002.png"),
        frame_count = 1,
        size = 256,
        scale = .5,
    },
    south = {
        filename = util.path("data/entities/transport_refinery/drone_refinery0003.png"),
        frame_count = 1,
        size = 256,
        scale = .5,
    },
    west = {
        filename = util.path("data/entities/transport_refinery/drone_refinery0004.png"),
        frame_count = 1,
        size = 256,
        scale = .5,
    },
}
drone_refinery.fluid_boxes =
{
  {
    production_type = "output",
    base_area = 50,
    base_level = 1,
    pipe_connections = {{ type="output", position = {.5, -1.5} }},
    pipe_covers = pipecoverspictures(),
    secondary_draw_orders = { north = -1, east = -1, west = -1}
  },
  off_when_no_fluid_recipe = false
}
drone_refinery.placeable_by = { item = name, count = 1}
drone_refinery.minable.result = name

local drone_refinery_items =
{
  {
    type = "item",
    name = name,
    localised_name = {name},
    icon = stone_furnace.icon,
    icon_size = stone_furnace.icon_size,
    flags = {},
    subgroup = "transport-drones",
    order = "e-a-c",
    stack_size = 10,
    place_result = name
  },
  {
    type = "recipe",
    name = name,
    localised_name = {name},
    icon = stone_furnace.icon,
    icon_size = stone_furnace.icon_size,
    --category = "transport",
    enabled = false,
    ingredients =
    {
      {"stone-furnace", 1},
      {"pipe", 10},
      {"iron-gear-wheel", 20},
    },
    energy_required = 5,
    result = name
  }
}

local drone_fuel = util.copy(data.raw.fluid["light-oil"])
drone_fuel.name = shared.fuel_fluid
drone_fuel.max_temperature = 1000
drone_fuel.subgroup = "drone-fuel"
-- drone_fuel.group = "intermediates"

local make_fuel_recipe = function(name, source, quality, category)
    name = "drone-fuel-from-" .. name
    return
    {
        type = "recipe",
        name = name,
        localised_name = {name, quality},
        icon = util.path("data/entities/transport_refinery/" .. name .. "-recipe-icon.png"),
        icon_size = 64,
        enabled = false,
        ingredients = {source},
        overload_multipler = 50,
        energy_required = 2,
        results =
        {
            {type = "fluid", name = shared.fuel_fluid, amount = 20, temperature = quality * 10}
        },
        category = category
    }
end

local drone_fuel_from_coal = make_fuel_recipe("coal", {type = "item", name = "coal", amount = 2}, 10, drone_refining_category.name)
local drone_fuel_from_coal_2 = make_fuel_recipe("coal-2", {type = "item", name = "coal", amount = 10}, 25, drone_refining_category.name)
local drone_fuel_from_gas = make_fuel_recipe("gas", {type = "fluid", name = "petroleum-gas", amount = 20}, 60, "chemistry")
local drone_fuel_from_rocket_fuel = make_fuel_recipe("rocket-fuel", {type = "item", name = "rocket-fuel", amount = 5}, 100, "chemistry")

data:extend{drone_fuel_subgroup}
data:extend{drone_fuel}
data:extend{drone_refining_category}
data:extend{drone_fuel_from_coal, drone_fuel_from_coal_2, drone_fuel_from_gas, drone_fuel_from_rocket_fuel}
data:extend{drone_refinery}
data:extend(drone_refinery_items)