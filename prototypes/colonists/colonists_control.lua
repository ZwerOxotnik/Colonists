local Colonists_died = function(event)
    local entity = event.entity
    local i = 1
    local inventory = entity.get_inventory(i)
    while inventory ~= nil do
        local colonists = inventory.get_item_count("colonist")

        local buildOutput = entity.force.entity_build_count_statistics.get_output_count("colonist")

        entity.force.entity_build_count_statistics.set_output_count("colonist", buildOutput + colonists)

        i = i + 1

        inventory = entity.get_inventory(i)
    end
end

local isInitColonists = false
function initColonists()
    if coli.ticks ~= nil and not isInitColonists then
        isInitColonists = true
        table.insert(coli.on_entitydied, Colonists_died)
    end
end