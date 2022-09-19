-- Instead of Item, create a HealItem, a convenient class for consumable healing items
local item, super = Class(Item, "fly")

function item:init()
    super:init(self)

    -- Display name
    self.name = "Fly"
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
    self.description = "Take off into the skys! Cant fly always,\nlike when there is heavy fog snow or rain."

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
    self.result_item = fly
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
    if Mod.heavyweather == true then
      --plays the fail to fly animation
      Game.world:showText({"* You attempted to take off.", "* You couldn't take off."})
    else
      --set states to flying
      checkz = true
      Mod:toggleFlying(true)
      --Game.world:showText({"* You attempted to take off.", "* You succeeded."}) --temporary
      Game.world:startCutscene(function(cutscene)
        local nellie = cutscene:getCharacter("nellie")
        cutscene:text("* You attempted to take off.[wait:5].[wait:5].[wait:10]")
        cutscene:text("* You succeeded.")
        nellie:setAnimation("jump_ball")
        if Mod.flytutorial == true then
          cutscene:text("* Hit [color:yellow]Z[color:white] or [color:yellow]ENTER[color:white] to land.")
          Mod.flytutorial = false
        end
        cutscene:during(function()
          if checkz == true then
            if Input.pressed("confirm") then
              --play landing anim
              Mod:toggleFlying(false)
              nellie:setSprite("walk")
              checkz = false
            end
          end
        end)
        cutscene:wait(2)
        cutscene:enableMovement()
        local wingicon = Sprite("wingicon", 200, 10)
        wingicon.layer = 1000
        wingicon.alpha = 0
        wingicon.parallax_x = 0
        wingicon.parallax_y = 0
        Game.stage:addChild(wingicon)
        while checkz == true do
          Game.stage.timer:tween(2, wingicon, {alpha = 1})
          cutscene:wait(1)
          Game.stage.timer:tween(2, wingicon, {alpha = 0.6})
          cutscene:wait(2)
        end
        wingicon:remove()
      end)
    end
end

return item