local character, super = Class(PartyMember, "nellie")

function character:init()
    super:init(self)

    -- Display name
    self.name = "Nellie Kaard"

    -- Actor (handles sprites)
    self:setActor("nellie")
    --self:setLightActor("nellie_lw") -DONT FORGOR

    -- Display level (saved to the save file)
    self.level = Game.chapter
    -- Default title / class (saved to the save file)
    self.title = "Light Angel\nDoes damage using\nlight flashes."

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 3
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {0.7, 0, 0}

    -- Whether the party member can act / use spells
    self.has_act = false
    self.has_spells = true

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "N-Action"

    -- Spells
    self:addSpell("flash_bang")
    self:addSpell("light_beam")
    

    -- Current health (saved to the save file)
    if Game.chapter == 1 then
        self.health = 90
    else
        self.health = 120
    end

    -- Base stats (saved to the save file)
    if Game.chapter == 1 then
        self.stats = {
            health = 90,
            attack = 10,
            defense = 2,
            magic = 5
        }
    else
        self.stats = {
            health = 120,
            attack = 12,
            defense = 5,
            magic = 8
        }
    end
    -- Max stats from level-ups
    if Game.chapter == 1 then
        self.max_stats = {
            health = 120
        }
    else
        self.max_stats = {
            health = 150
        }
    end

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/axe"

    -- Equipment (saved to the save file)
    self:setWeapon("mane_ax")
    if Game.chapter >= 2 then
        self:setArmor(1, "amber_card")
        self:setArmor(2, "amber_card")
    end

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    -- Character color (for action box outline and hp bar)
    self.color = {1, 0.4, 1}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0.8, 0.6, 0.8}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {234/255, 121/255, 200/255}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0.5, 0, 0.5}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {1, 0.5, 1}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/nellie/head"
    -- Path to head icons used in battle
    self.head_icons = "party/nellie/icon"
    -- Name sprite (optional)
    self.name_sprite = "party/nellie/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/mash"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 0.9

    -- Battle position offset (optional)
    self.battle_offset = {3, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = "Hello-eth, get up! \nTheres a wordl that needs you." -- Handled by getGameOverMessage for Susie

    -- Character flags (saved to the save file)
    self.flags = {
        ["auto_attack"] = false,
    }
end

function character:onTurnStart(battler)
    if self:getFlag("auto_attack", false) then
        Game.battle:pushForcedAction(battler, "AUTOATTACK", Game.battle:getActiveEnemies()[1], nil, {points = 150})
    end
end

function character:onAttackHit(enemy, damage)
    if damage > 0 then
        Assets.playSound("impact", 0.8)
        Game.battle.shake = 0.5
    end
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 2 == 0 then
        self:increaseStat("health", 1)
    end
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
        self:increaseStat("magic", 1)
    end
end

function character:getGameOverMessage(main)
    return {
        "This doesnt feel right,[wait:5]\nget up, we can try again",
        main.name..",[wait:5]\nget up...!"
    }
end

function character:canEquip(item, slot_type, slot_index)
    if item then
        return super:canEquip(self, item, slot_type, slot_index)
    else
        local item
        if slot_type == "weapon" then
            item = self:getWeapon()
        elseif slot_type == "armor" then
            item = self:getArmor(slot_index)
        else
            return true
        end
        return false
    end
end

function character:getReaction(item, user)
    if item or user.id ~= self.id then
        return super:getReaction(self, item, user)
    else
        return "Hands off please..."
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/halo")
        love.graphics.draw(icon, x-38, y+6, 0, 2, 2)
        love.graphics.print("Empathy:", x-6, y)
        if Game.chapter == 1 then
            love.graphics.print("99", x+130, y)
        else
            love.graphics.print("Very", x+130, y)
        end
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/halo")
        love.graphics.draw(icon, x-38, y+6, 0, 2, 2)
        if Game.chapter == 1 then
            love.graphics.print("Cheeriness", x-6, y, 0, 0.8, 1)
            love.graphics.print("100", x+130, y)
        else
            love.graphics.print("Cheeriness:", x-6, y, 0, 0.8, 1)
            if Mod.Cheeriness == "much" then
              love.graphics.print("Much", x+130, y)
            elseif Mod.Cheeriness == "..." then
              love.graphics.print("...", x+130, y)
            elseif Mod.Cheeriness == "None" then
              love.graphics.print("None", x+130, y)
            else
              love.graphics.print("Low", x+130, y)
            end
        end
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/heart")
        love.graphics.draw(icon, x-38, y+6, 0, 2, 2)
        love.graphics.print("Love:", x-6, y)

        love.graphics.draw(icon, x+70, y+6, 0, 2, 2)
        love.graphics.draw(icon, x+100, y+6, 0, 2, 2)
        return true
    end
end

return character