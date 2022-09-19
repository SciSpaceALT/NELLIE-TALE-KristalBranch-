local nightmarion, super = Class(Encounter)

function nightmarion:init()
    super:init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Wait-[wait:10] What is this thing...?"

    -- Battle music ("battle" is rude buster)
    self.music = "And You're Never Waking Up"
    -- Enables the purple grid battle background
    self.background = false

    -- Add the dummy enemy to the encounter
    self:addEnemy("nightmarion")

    --
end

function nightmarion:onGameOver()
    Game.battle:startCutscene("nelliedeath.nelliedeath")
    return true
end
return nightmarion