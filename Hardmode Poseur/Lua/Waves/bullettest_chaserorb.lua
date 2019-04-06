-- The chasing attack from the documentation example.
chasingbullet = CreateProjectile('bullet', Arena.width/2 - 5, Arena.height/2 - 5)
chasingbullet2 = CreateProjectile('bullet', Arena.width + 5, Arena.height/2 - 5)
chasingbullet3 = CreateProjectile('bullet', Arena.width/2 - 5, Arena.height + 5)
chasingbullet4 = CreateProjectile('bullet', Arena.width + 5, Arena.height + 5)
chasingbullet5 = CreateProjectile('bullet', Arena.width/1.35, Arena.height/1.35)

chasingbullet.SetVar('xspeed', 0)
chasingbullet.SetVar('yspeed', 0)
chasingbullet2.SetVar('xspeed2', 0)
chasingbullet2.SetVar('yspeed2', 0)
chasingbullet3.SetVar('xspeed3', 0)
chasingbullet3.SetVar('yspeed3', 0)
chasingbullet4.SetVar('xspeed4', 0)
chasingbullet4.SetVar('yspeed4', 0)
chasingbullet5.SetVar('xspeed5', 0)
chasingbullet5.SetVar('yspeed5', 0)


function Update()
    local xdifference = Player.x - chasingbullet5.x + 10
    local ydifference = Player.y - chasingbullet5.y + 10
    local xspeed = chasingbullet.GetVar('xspeed') / 2 + xdifference / 75
    local yspeed = chasingbullet.GetVar('yspeed') / 2 + ydifference / 75
	local xdifference2 = Player.x - chasingbullet5.x + 10
    local ydifference2 = Player.y - chasingbullet5.y + 10
    local xspeed2 = chasingbullet2.GetVar('xspeed2') / 2 + xdifference2 / 75
    local yspeed2 = chasingbullet2.GetVar('yspeed2') / 2 + ydifference2 / 75
	local xdifference3 = Player.x - chasingbullet5.x + 10
    local ydifference3 = Player.y - chasingbullet5.y + 10
    local xspeed3 = chasingbullet3.GetVar('xspeed3') / 2 + xdifference3 / 75
    local yspeed3 = chasingbullet3.GetVar('yspeed3') / 2 + ydifference3 / 75
	local xdifference4 = Player.x - chasingbullet5.x + 10
    local ydifference4 = Player.y - chasingbullet5.y + 10
    local xspeed4 = chasingbullet4.GetVar('xspeed4') / 2 + xdifference4 / 75
    local yspeed4 = chasingbullet4.GetVar('yspeed4') / 2 + ydifference4 / 75
	local xdifference5 = Player.x - chasingbullet5.x + 10
    local ydifference5 = Player.y - chasingbullet5.y + 10
    local xspeed5 = chasingbullet5.GetVar('xspeed5') / 2 + xdifference5 / 75
    local yspeed5 = chasingbullet5.GetVar('yspeed5') / 2 + ydifference5 / 75
    chasingbullet.Move(xspeed, yspeed)
    chasingbullet.SetVar('xspeed', xspeed)
    chasingbullet.SetVar('yspeed', yspeed)
	chasingbullet2.Move(xspeed2, yspeed2)
    chasingbullet2.SetVar('xspeed2', xspeed2)
    chasingbullet2.SetVar('yspeed2', yspeed2)
	chasingbullet3.Move(xspeed3, yspeed3)
    chasingbullet3.SetVar('xspeed3', xspeed3)
    chasingbullet3.SetVar('yspeed3', yspeed3)
	chasingbullet4.Move(xspeed4, yspeed4)
    chasingbullet4.SetVar('xspeed4', xspeed4)
    chasingbullet4.SetVar('yspeed4', yspeed4)
	chasingbullet5.Move(xspeed5, yspeed5)
    chasingbullet5.SetVar('xspeed5', xspeed5)
    chasingbullet5.SetVar('yspeed5', yspeed5)
end

function OnHit(bullet)
    Player.hurt(10)
end