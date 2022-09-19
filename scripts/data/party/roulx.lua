local character, super = Class(PartyMember, "roulx")

function character:init()
    super:init(self)

    -- Display name
    self.name = "Roulx"

    -- Actor (handles overworld/battle sprites)
    self:setActor("roulx")
    --self:setLightActor("roulx_lw")

    -- Display level (saved to the save file)
    self.level = Game.chapter
    -- Default title / class (saved to the save file)
    if Game.chapter == 1 then
        self.title = "Duke of puzzles\nCowers around while\nsetting various puzzles."
    else
        self.title = "Duke of puzzles\nCowers around while\nsetting various puzzles."
    end

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 1
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {0.1, 0.1, 1}

    -- Whether the party member can act / use spells
    self.has_act = true
    self.has_spells = false

    -- Whether the party member can use their X-Action
    self.has_xact = false
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "R-Action"

    -- Current health (saved to the save file)
    if Game.chapter == 1 then
        self.health = 70
    else
        self.health = 90
    end

    -- Base stats (saved to the save file)
    if Game.chapter == 1 then
        self.stats = {
            health = 110,
            attack = 7,
            defense = 4,
            magic = 0
        }
    else
        self.stats = {
            health = 90,
            attack = 12,
            defense = 5,
            magic = 0
        }
    end
    -- Max stats from level-ups
    if Game.chapter == 1 then
        self.max_stats = {
            health = 160
        }
    else
        self.max_stats = {
            health = 120
        }
    end

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/sword" --MAY NEED REPLACEMENT

    -- Equipment (saved to the save file)
    self:setWeapon("wood_blade") --Needs changing
    if Game.chapter >= 2 then
        self:setArmor(1, "amber_card")
        self:setArmor(2, "amber_card")
    end

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    -- Character color (for action box outline and hp bar)
    self.color = {0.1, 0.1, 1}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0.15, 0.3, 1}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {0, 50/255, 1}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0.1, 0.1, 1}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {0.1, 0.1, 1}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/roulx/head"
    -- Path to head icons used in battle
    self.head_icons = "party/roulx/icon"
    -- Name sprite
    self.name_sprite = "party/roulx/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/cut"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 3

    -- Battle position offset (optional)
    self.battle_offset = {2, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = "Rest in peaceth..."
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
    end
end

function character:onPowerSelect(menu)
    if Utils.random() <= 0.03 then
        menu.kris_dog = true
    else
        menu.kris_dog = false
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 and menu.kris_dog then
        local frames = Assets.getFrames("misc/dog_sleep")
        local frame = math.floor(Kristal.getTime()) % #frames + 1
        love.graphics.print("Dog:", x, y)
        love.graphics.draw(frames[frame], x+120, y+5, 0, 2, 2)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        love.graphics.draw(icon, x+90, y+6, 0, 2, 2)
        if Game.chapter >= 2 then
            love.graphics.draw(icon, x+110, y+6, 0, 2, 2)
        end
        return true
    end
end

return character