-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Smells like the work\rof an enemy stand.", "Poseur is posing like his\rlife depends on it.", "Poseur's limbs shouldn't be\rmoving in this way."}
commands = {"LessHealPot", "LessHealPot", "LessHealPot", "PumpPie", "PumpPie", "HealPot"}
randomdialogue = {"Random\nDialogue\n1.", "Random\nDialogue\n2.", "Random\nDialogue\n3."}

sprite = "pumpkin" --Always PNG. Extension is added automatically.
name = "items"
hp = 100
atk = 1
def = 1
check = "puk"
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = false

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
		Audio.PlaySound("fool")
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "LESSHEALPOT" then
        BattleDialog({DrinkMessage("Lesser Healing\rPotion", 10)})
        Player.Heal(10)
        RemoveCommand("LessHealPot")
	elseif command == "PUMPPIE" then
        BattleDialog({EatMessage("Pumpkin Pie\nIt's very tasty!", 12)})
        Player.Heal(12)
        RemoveCommand("PumpPie")	
	elseif command == "HEALPOT" then
        BattleDialog({DrinkMessage("Healing Potion", 15)})
        Player.Heal(15)
        Encounter.GetVar("enemies")[1].Call("Drop")
        RemoveCommand("HealPot")	
    end
	
end

function DrinkMessage(item, amount)
    local maxhp = 16 + (Player.lv * 4)
    local msg = "You recovered " .. amount .. " HP!"
    if(Player.hp + amount >= maxhp) then
        msg = "Your HP was maxed out."
    end
    return "[voice:ui]You drank the " .. item .. ".\n" .. msg
end

function EatMessage(item, amount)
    local maxhp = 16 + (Player.lv * 4)
    local msg = "You recovered " .. amount .. " HP!"
    if(Player.hp + amount >= maxhp) then
        msg = "Your HP was maxed out."
    end
    return "[voice:ui]You eat the " .. item .. "\n" .. msg
end

function RemoveCommand(name)
    for i=1,#commands do
        if(commands[i] == name) then
            table.remove(commands, i)
            return
        end
    end
end

