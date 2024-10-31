name = "Willow's Fire Enchant"
version = "1.1.2"
description = [[version: ]] .. version .. [[

薇洛的火焰附魔MOD。
1.处于'狂热焚烧'状态下的薇洛可以点燃攻击目标。
2.火球术的持续时间延长。
3.打火机可以冷却火球或矮星。
所有功能均可开关，玩得开心！

Willow's Fire Enchant MOD
1.Willow in 'fire frenzy' state can ignite attack targets.
2.The duration of Fireball is extended.
3.Lighters can cool fireballs or dwarfs.
All functions can be switched on and off, have fun!]]

author = "NebulaKKK"
forumthread = ""

api_version = 10

icon_atlas = "modicon.xml"
icon = "modicon.tex"

all_clients_require_mod = true
client_only_mod = false
dst_compatible = true
--priority = -9999 --优先级，值越大越先加载 默认0
server_filter_tags = {"character"}

configuration_options = {
    {
        name = "fire_frenzy",
        label = "狂热焚烧",
        hover = "Buff状态下的薇洛可以点燃攻击目标。\nWillow in 'fire frenzy' state can ignite targets.",
        options = {{
            description = "ON",
            data = true,
            hover = "点燃目标"
        }, {
            description = "OFF",
            data = false,
            hover = ""
        }},
        default = true
    },
    {
        name = "fireball_enhance",
        label = "火球延长",
        hover = "延长火球术持续时间。\nExtend the duration of Fireball spell.",
        options = {{
            description = "ON",
            data = true,
            hover = "和矮星一样持续3.5天"
        }, {
            description = "OFF",
            data = false,
            hover = "原版持续1天"
        }},
        default = true
    },
    {
        name = "cooling_star",
        label = "矮星冷却",
        hover = "薇洛可以用打火机右键火球/矮星切换为极光。\nWillow holds a lighter can right-click to switch fireball or dwarf star to polar light.",
        options = {{
            description = "ON",
            data = true,
            hover = ""
        }, {
            description = "OFF",
            data = false,
            hover = ""
        }},
        default = true
    },
}