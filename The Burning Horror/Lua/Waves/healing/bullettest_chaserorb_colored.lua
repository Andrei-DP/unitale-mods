-- The chasing attack from the documentation example.
spawntimer = 0
bullets = {}
colors = {"regular", "cyan", "orange"}

function Update()
	spawntimer = spawntimer + 1
    if spawntimer%30 == 0 then

        local bulletType = colors[math.random(#colors)]
        local chasingbullet = CreateProjectile('bullet', Arena.width/2, Arena.height/2)
        if bulletType == "cyan" then
            chasingbullet.sprite.color = {0/255, 162/255, 232/255}
        elseif bulletType == "orange" then
            chasingbullet.sprite.color = {255/255, 154/255, 34/255}
		end

        chasingbullet.SetVar('color', bulletType)
		chasingbullet.SetVar('xspeed', 0)
		chasingbullet.SetVar('yspeed', 0)
        table.insert(bullets, chasingbullet)
    end

	for i=1,#bullets do
        local bullet = bullets[i]
        -- Note this new if check. We're going to remove bullets, and we can't move bullets that were removed.
        if bullet.isactive then
            local xdifference = Player.x - bullet.x
			local ydifference = Player.y - bullet.y
			local xspeed = bullet.GetVar('xspeed') / 2 + xdifference / 100 * 1.5
			local yspeed = bullet.GetVar('yspeed') / 2 + ydifference / 100 * 1.5
			bullet.Move(xspeed, yspeed)
			bullet.SetVar('xspeed', xspeed)
			bullet.SetVar('yspeed', yspeed)
        end
    end
end

function OnHit(bullet) 
    local color = bullet.GetVar("color")
    local damage = 3
    if color == "regular" then
        Player.Hurt(damage)
    elseif color == "cyan" and Player.isMoving then
        Player.Hurt(damage)
    elseif color == "orange" and not Player.isMoving then
        Player.Hurt(damage)
    end
end