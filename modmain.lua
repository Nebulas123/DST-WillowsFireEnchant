GLOBAL.setmetatable(env, {__index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end})

if GetModConfigData("fireball_enhance") then
    TUNING.EMBER_STAR_DURATION = 480 * 3.5 --total_day_time = 30*16 
end

if GetModConfigData("fire_frenzy") then
    AddClassPostConstruct("components/weapon", function(self)
        local old_OnAttack = self.OnAttack
        function self:OnAttack(attacker, target, projectile)
            if attacker:HasTag("firefrenzy") then
                --target may be killed or removed in combat damage phase
                if target ~= nil and target:IsValid() and target.components.burnable ~= nil then
                    target.components.burnable:Ignite(nil, target, attacker)
                end
                if old_OnAttack ~= nil then
                    old_OnAttack(self, attacker, target, projectile)
                end
            else
                -- 执行原来的 OnAttack 函数
                if old_OnAttack ~= nil then
                    old_OnAttack(self, attacker, target, projectile)
                end
            end
        end
    end)
end

if GetModConfigData("cooling_star") then
    modimport("scripts/action_cooling_star.lua")
end