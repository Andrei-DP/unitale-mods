-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"The air is filled with FIRE."}
commands = {"Dinner", "Eat"}
randomdialogue = {"[func:SetSprite,pumpkin]*fire\nnoises*", "[func:SetSprite,pumpkin]...", "[func:SetSprite,pumpkin]BOO!!!"}

sprite = "pumpkin" --Always PNG. Extension is added automatically.
name = "The Flaming Pumpkin"
hp = 500
atk = 1
def = 10
check = "The best Halloween horror.\n[color:ff0000]STRIKE IT DOWN!"
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true

eatcount = 0

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
		Audio.PlaySound("miss")
    else
        -- player did actually attack
		Audio.PlaySound("fool")
		SetSprite('pumpkin_hurt')
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "DINNER" then
        BattleDialog("blah blah blah")
		SetGlobal('heal', true)
	elseif command == "EAT" then
        healed = GetGlobal('healed')
		if(healed == false) then
			BattleDialog("You can't do it.")
		else
			if(eatcount > -1 and eatcount < 6) then
				BattleDialog("Ouch! It's very [color:ff6a00]HOT!!![color:ffffff]")
				Player.hurt(3, 0)
				Audio.PlaySound("miss")
			elseif(eatcount == 6) then
				Audio.Stop()
				BattleDialog({"[noskip]You're try to eat it.[w:35]\nAgain.", "[noskip][w:35]It's very [color:ff6a00]HOT[color:ffffff] as always.[w:35]\nBut...", "[noskip]You feel wierd feeling... [w:35]\nFelling of... [w:35]Healing?..", "Magicaly you healed!\n[func:HealPlayer]Your [color:ff0000]HP[color:ffffff] was [color:00ff21]maxed out![color:ffffff]"})
			elseif(eatcount > 6) then
				BattleDialog("Your HP was maxed out.")
				Player.heal(99)
			end
			eatcount = eatcount + 1
		end
    end
end

function HealPlayer()
	Player.heal(99)
	Audio.LoadFile("burnighorror")
	Audio.PlaySound("mystery")
end