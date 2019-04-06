-- The bouncing bullets attack from the documentation example.
spawntimer = 0
local fly = CreateProjectile('flyingthing1', 0, Arena.height + 200)
fly.SetVar('flyvelx', 1)
fly.SetVar('flyvely', -0.3)
bullets = {}

function Update()
    spawntimer = spawntimer + 1
    if spawntimer%10 == 0 then
        local posx = fly.x
        local posy = fly.y
        local bullet = CreateProjectile('bullet', posx, posy)
        bullet.SetVar('velx', 1 - 2*math.random())
        bullet.SetVar('vely', 0)
        table.insert(bullets, bullet)
    end
    
    for i=1,#bullets do
        local bullet = bullets[i]
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
	
	local flyvelx = fly.GetVar('flyvelx')
	local flyvely = fly.GetVar('flyvely')
    local flynewposx = fly.x + flyvelx
    local flynewposy = fly.y + flyvely
	if(fly.x > Arena.width/2) then
        newposx = Arena.width/2 + 1
        flyvelx = -1
        fly.sprite.Set("flyingthing")    
    end
	--if(flyvelx > 0) then
		
	--elseif(fly.flyvelx < 0) then 
        --local fly = CreateProjectile('flyingthing', fly.x, fly.y)
            
    --end
	if(fly.x < -Arena.width/2) then
        newposx = -Arena.width/2 - 1
        flyvelx = 1
		fly.sprite.Set("flyingthing1") 
            
    end
	fly.MoveTo(flynewposx, flynewposy)
    fly.SetVar('flyvely', flyvely)
    fly.SetVar('flyvelx', flyvelx)

end