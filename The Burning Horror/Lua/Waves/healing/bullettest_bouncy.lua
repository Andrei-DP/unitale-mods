-- The bouncing bullets attack from the documentation example.
spawntimer = 0
bullets = {}
colors = {"regular", "regular", "regular", "green"}

function Update()
    spawntimer = spawntimer + 1
    if spawntimer%15 == 0 then
        local posx = 30 - math.random(60)
        local posy = Arena.height/2
		local bulletType = colors[math.random(#colors)]
        local bullet = CreateProjectile('bullet', posx, posy)
		if bulletType == "green" then
            bullet.sprite.color = {64/255, 252/255, 64/255}
        end
		bullet.SetVar('color', bulletType)
        bullet.SetVar('velx', 1 - 2*math.random())
        bullet.SetVar('vely', 0)
        table.insert(bullets, bullet)
    end
    
    for i=1,#bullets do
	    local bullet = bullets[i]
        if bullet.isactive then
            local velx = bullet.GetVar('velx')
            local vely = bullet.GetVar('vely')
            local newposx = bullet.x + velx
            local newposy = bullet.y + vely
            if(bullet.x > -Arena.width/2 and bullet.x < Arena.width/2) then
                if(bullet.y < -Arena.height/2 + 8) then 
                    newposy = -Arena.height/2 + 8
                    vely = 4
                end
            end
            vely = vely - 0.04
            bullet.MoveTo(newposx, newposy)
            bullet.SetVar('vely', vely)
        end
    end
end

function OnHit(bullet) 
    local color = bullet.GetVar("color")
    local damage = 6
    if color == "regular" then
        Player.Hurt(damage)
    elseif color == "green" then
        Player.Heal(2)
        bullet.Remove()
		SetGlobal('healed', true)
    end
end