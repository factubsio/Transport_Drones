require("data/make_request_recipes")

-- ruin gates and rails

local rail_collision_mask = {"floor-layer", "water-tile", "item-layer"}
local gate_collision_mask = {"item-layer", "player-layer", "train-layer", "water-tile"}
local opened_gate_collision_mask = {"item-layer", "water-tile", "floor-layer"}

for k, rail in pairs (data.raw["straight-rail"]) do
  if rail.collision_mask then
    util.remove_from_list(rail.collision_mask, "object-layer")
  else
    rail.collision_mask = rail_collision_mask
  end
  table.insert(rail.collision_mask, "layer-14")
  rail.selection_priority = 45
end

for k, rail in pairs (data.raw["curved-rail"]) do
  if rail.collision_mask then
    util.remove_from_list(rail.collision_mask, "object-layer")
  else
    rail.collision_mask = rail_collision_mask
  end
  table.insert(rail.collision_mask, "layer-14")
  rail.selection_priority = 45
end

for k, gate in pairs (data.raw.gate) do
  if gate.collision_mask then
    util.remove_from_list(gate.collision_mask, "object-layer")
  else
    gate.collision_mask = gate_collision_mask
  end
  if gate.opened_collision_mask then
    util.remove_from_list(gate.opened_collision_mask, "object-layer")
  else
    gate.opened_collision_mask = opened_gate_collision_mask
  end
end