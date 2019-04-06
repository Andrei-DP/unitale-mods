-- A basic encounter script skeleton you can copy and modify for your own creations.

music = "stronger_monsters" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "You have only 5 HP!" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"bullettest_chaserorb"}
wavetimer = 5.0
arenasize = {155, 130}
firstturn = false

enemies = {
"poseur"
}

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"bullettest_bouncy", "bullettest_chaserorb", "bullettest_touhou"}


function EncounterStarting()
    -- If you want to change the game state immediately, this is the place.
	Player.name = "chara"
	Player.lv = 10
	Player.hp = 5
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
    enemies[1].SetVar('currentdialogue', {"[func:SetSprite,poseur]It's\nNOT\nworking."})
	if not firstturn then
		Audio.LoadFile(music)
		firstturn = true
	end
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleSpare()
     State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    BattleDialog({"You eat your Spikey Ball. \nOuch! It's very painfull!"})
	Player.hurt(1)
	enemies[1].SetVar('currentdialogue', {"YOU IDIOT!\nIT'S NOT\nWORKING!!!"})
end