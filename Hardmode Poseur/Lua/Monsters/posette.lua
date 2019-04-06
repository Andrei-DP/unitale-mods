-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Poseur angrily looks at you.\nPosette too.", "Poseur is angry of you.\nPosette too.", "Poseur prepares a HARD example\rattack.\nPosette too."}
commands = {}
randomdialogue = {"Random\nDialogue\n1.", "Random\nDialogue\n2.", "Random\nDialogue\n3."}

sprite = "posette" --Always PNG. Extension is added automatically.
name = "Posette"
hp = 500
atk = 10
def = 1
check = "Whaaat??? \nDid you think that there would \rbe the most basic text???"
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
		SetSprite("posette_hurt")
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    
end
