--talk to 'em!
local item, super = Class(Item, "talk")

function item:init()
    super:init(self)

    -- Display name
    self.name = "Talk"
    -- Name displayed when used in battle (optional)
    self.use_name = "UUSETHISGAMEDIE"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Gamewil\ngetdie"
    -- Shop description
    self.shop = "What you cant buy dis"
    -- Menu description
    self.description = "Talk to your pocket buddies!\nSocialization is great!"

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
    self.result_item = "talk"
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
        nellie = "Hey guys, How's it goin!",
        ralsei = "I like the texture!",
        noelle = "That was underwhelming...",
    }
end

function item:onWorldUse()
    Assets.playSound("egg")
    --Game.world:showText({"* You attempted to take off.", "* You succeeded."})
    --temporary heavyweather variable
    --Mod.heavyweather = nil
    Game.world:startCutscene(function(cutscene)
    	local nellie = cutscene:getCharacter("nellie")
        cutscene:text("* Time to talk to your [color:yellow]POCKET BUDDIES![color:white]")
        cutscene:text("* Who do you want to talk to?")
        if Game:getFlag("PocketJevil") == false and Game:getFlag("Pocket___") == false and Game:getFlag("PocketEggcat") == false and Game:getFlag("PocketCluwneer") == false and Game:getFlag("PocketTheatricana") == false and Game:getFlag("PocketGalaria") == false and Game:getFlag("PocketDraco") == false and Game:getFlag("PocketCandelaria") == false and Game:getFlag("PocketMarvin") == false then 
    		cutscene:text("* Looks like you don't have any [color:yellow]POCKET BUDDIES[color:white] to talk to, go make freinds.")
    	end
    end)
end

return item