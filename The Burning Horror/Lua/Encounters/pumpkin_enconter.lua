-- A basic encounter script skeleton you can copy and modify for your own creations.
-- /\ - No, no, no, it's not

music = "burnighorror" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
SetGlobal('heal', false)
SetGlobal('healed', false)
encountertext = "The Flaming Pumpkin blocks your\rway!" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"bullettest_chaserorb"}
wavetimer = 6.0
arenasize = {155, 130}

enemies = {
"pumpkin",
"items"
}

enemypositions = {
{0, 0},
{500, 500}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"regular/bullettest_bouncy", "regular/bullettest_chaserorb_colored", "regular/bullettest_touhou", "regular/bullettest_rain", "regular/bullettest_fly", "regular/bullettest_minipump1", "regular/bullettest_minipump2", "regular/bullettest_minipump3", "regular/bullettest_flamepump_inverted"}
--healing_attacks = {"regular/bullettest_bouncy", "regular/bullettest_chaserorb_colored", "regular/bullettest_touhou", "regular/bullettest_rain", "regular/bullettest_fly", "regular/bullettest_minipump1", "regular/bullettest_minipump2", "regular/bullettest_minipump3", "regular/bullettest_flamepump_inverted"}
--possible_attacks = {"bullettest_chaserorb_colored"}
healing_attacks = {"healing/bullettest_bouncy"}

function EncounterStarting()
    -- If you want to change the game state immediately, this is the place.
	enemies[2].Call("SetActive", false)
	Player.lv = 5
	Player.hp = 36
	Player.name = "dragon"
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
    -- enemies[1].SetVar('currentdialogue', {"It's\nworking."})
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
	healing = GetGlobal('heal')
	if(healing == true) then
		nextwaves = { healing_attacks[math.random(#healing_attacks)] }
	else
		nextwaves = { possible_attacks[math.random(#possible_attacks)] }
	end
	if(nextwaves == "bullettest_fly") then
		wavetimer = 10.0
	else
		wavetimer = 6.0
	end
	SetGlobal('heal', false)
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleSpare()
     State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    BattleDialog({"Selected item " .. ItemID .. "."})
end

goback = false

function Update()
	if(goback) then
		State("ACTIONSELECT")
		goback = false
	end
	if(gotoitemenu) then
		enemies[2].Call("SetActive", true)
		enemies[1].Call("SetActive", false)
		State("ACTMENU")
		gotoitemenu = false
	end
	if(initemmenu and Input.Cancel == 1) then
		BattleDialog({"[next]"})
		initemmenu = false
		goback = true
	end
end
function EnteringState(newstate, oldstate)
	if(newstate == "ITEMMENU") then
		if(#enemies[2].GetVar("commands") == 0) then
			State("ACTIONSELECT")
		else
			initemmenu = true
			gotoitemenu = true
		end
	end
	if((newstate ~= "ACTMENU" and newstate ~= "ITEMMENU") and initemmenu) then
		enemies[1].Call("SetActive", true)
		enemies[2].Call("SetActive", false)
		initemmenu = false
	end
end