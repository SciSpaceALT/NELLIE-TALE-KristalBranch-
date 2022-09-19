local nightmarion, super = Class(EnemyBattler)

function nightmarion:init()
    super:init(self)

    -- Enemy name
    self.name = "Nightmarion"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("nightmarion")

    -- Enemy health
    self.max_health = 42069
    self.health = 42069
    -- Enemy attack (determines bullet damage)
    self.attack = 5
    -- Enemy defense (usually 0)
    self.defense = 0.75
    -- Enemy reward
    self.money = 666666666

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "biter_1",
        "X2one",
        "biter_2",
        "biterhell"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        "...",
        ":X",
        "0V0",
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 666 DF 0.75\n* A nightmare beyond all others.\n* Its strangley unfamiliar."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The- thing.. gives you an\n empty glare.",
        "* ...",
        "* There is tension in the air",
        "* This is the nightmare to top them all.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* ... YOU CAN'T WIN..."

    -- Register act called "Smile"
    --self:registerAct("Glare", "glare dissaproovingly\n at the creature")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    --self:registerAct("Question", "Question the existence\n of this being")
end

function nightmarion:onAct(battler, name)
    if name == "Glare" then
        -- Give the enemy 100% mercy
        --self:addMercy(100)
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "... ^q^"
        -- Act text (since it's a list, multiple textboxes)
        self:addMercy(50)
        --self:damage(450) REMEMBER TO FIX
        return {
           
            "* You Glare dissaproovingly.[wait:10]\n* The rabbit seems to start melting.",
            "* ..."
        }

    elseif name == "Question" then
        -- Make this enemy tired
        self:setTired(true)
        return "* You questioned the reality of this melty goop.\n* It became [color:blue]TIRED[color:reset]..."

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The dummy spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super:onAct(self, battler, name)
end

return nightmarion