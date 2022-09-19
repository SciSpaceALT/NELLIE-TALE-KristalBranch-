-- Instead of Item, create a HealItem, a convenient class for consumable healing items
local item, super = Class(Item, "lightbridge")

function item:init()
    super:init(self)

    -- Display name
    self.name = "Light Bridge"
    -- Name displayed when used in battle (optional)
    self.use_name = "UUSETHISGAMEDIE"

    -- Item type (item, key, weapon, armor)
    self.type = "spell"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Gamewil\ngetdie"
    -- Shop description
    self.shop = "What you cant buy dis"
    -- Menu description
    self.description = "Create a bridge of pure light across the darkness! Can't bridge large gaps."

    -- Amount healed (HealItem variable)
    self.heal_amount = nil

    -- Default shop price (sell price is halved)
    self.price = 666
    -- Whether the item can be sold
    self.can_sell = false

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "world"
    -- Item this item will get turned into when consumed
    self.result_item = lightbridge
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions (key = party member id)
    self.reactions = {
        susie = "Hey! It's hollow inside!",
        ralsei = "I like the texture!",
        noelle = "That was underwhelming...",
    }
end

function item:onWorldUse()
    --Assets.playSound("egg")
    --Game.world:showText({"* You attempted to take off.", "* You succeeded."})
    --temporary heavyweather variable
    --Mod.heavyweather = nil
    -- start cutscene "MISSINGNO"
--    if Mod.bridgeable == true then
--      --plays the fail to fly animation
--       --check current map to get coords for bridge spawn
--      --Game.world:showText({"* You shined the light within your SOUL to create a bridge.", "* It took perfect form."})
--      Mod:toggleBridge(true)
--      Game.world:startCutscene(function(cutscene)
--        --Game.world:showText({"* You shined the light within your SOUL to create a bridge.", "* It took perfect form."})
--        cutscene:text("* You shined the light within your SOUL to create a bridge.")
--        cutscene:text("* It took perfect form.")
--        Mod.lightbridge.alpha = 0.05
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.05
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.1
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.15
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.20
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.25
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.30
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.35
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.40
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.45
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.50
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.55
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.60
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.65
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.70
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.75
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.80
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.85
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.90
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 0.95
--        cutscene:wait(0.2)
--        Mod.lightbridge.alpha = 1
--        cutscene:wait(0.2)
--      end)
--    else
      --set states to flying
--      Game.world:showText({"* You shined the light within your SOUL to create a bridge.", "* It withered away as soon as it took form."}) --temporary
--    end
end

return item