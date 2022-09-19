return {
    nelliedeath = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* ...")

        -- Hurt the target enemy for 1 damage
        Assets.playSound("snd_damage")
        --enemy:hurt(1, battler)
        -- Wait 1 second
        cutscene:wait(1)

        -- Susie text
        cutscene:text("* ROULXLS!!!", "", "nellie")
        -- Ralsei text, if he's in the party
        cutscene:text("* Nellie,[wait:5] I'm... [wait:5]Fine...[wait:5]", "", "roulxls")
        Game.world:startCutscene("nelliewakesupandbamtherescreditsagain")
      
    end
}