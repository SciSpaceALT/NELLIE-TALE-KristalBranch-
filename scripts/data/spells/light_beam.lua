local spell, super = Class(Spell, "light_beam")

function spell:init()
    super:init(self)

    -- Display name
    self.name = "Light Beam"
    -- Name displayed when cast (optional)
    self.cast_name = "LIGHT BEAM"

    -- Battle description
    self.effect = "Heals with\nthe power\nof light"
    -- Menu description
    self.description = "Heals a party member using the\nthe power of the light."

    -- TP cost
    self.cost = 32

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"

    -- Tags that apply to this spell
    self.tags = {"heal"}
end

function spell:onCast(user, target)
    target:heal(user.chara:getStat("magic") + 45)
end

return spell
