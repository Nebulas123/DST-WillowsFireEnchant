local function transform_fireball(inst, target, doer)
	if inst ~= nil and inst:IsValid() and target ~= nil and target:IsValid() then
		if target.prefab == "emberlight" or target.prefab == "stafflight" then
			local x, y, z = target.Transform:GetWorldPosition()
			local prefab_aurora = SpawnPrefab("staffcoldlight")
			if prefab_aurora ~= nil then
				prefab_aurora.Transform:SetPosition(x, y, z)
			end
			inst.SoundEmitter:PlaySound("dontstarve/common/staff_star_create")
			target:Remove()
		end
	end
end

local TRANSFORM_FIREBALL = Action({ priority = 999 })
TRANSFORM_FIREBALL.rmb = true
TRANSFORM_FIREBALL.distance = 1
TRANSFORM_FIREBALL.mount_valid = true
TRANSFORM_FIREBALL.id = "TRANSFORM_FIREBALL"
TRANSFORM_FIREBALL.str = "冷却"

TRANSFORM_FIREBALL.fn = function(act)
    if act.doer ~= nil and act.invobject ~= nil and act.target ~= nil then
        transform_fireball(act.invobject, act.target, act.doer)
		return true
    end
end

AddAction(TRANSFORM_FIREBALL)

AddComponentAction("EQUIPPED", "equippable", function(inst, doer, target, actions, right)
	if right and doer ~= nil and doer:HasTag("player") and doer:HasTag("pyromaniac") and target ~= nil -- willow tag
	and inst.prefab == "lighter" and (target.prefab == "emberlight" or target.prefab == "stafflight") then
        table.insert(actions, ACTIONS.TRANSFORM_FIREBALL)
    end
end)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.TRANSFORM_FIREBALL, "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TRANSFORM_FIREBALL, "give"))