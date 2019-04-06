-- The bouncing bullets attack from the documentation example.
local minipump = CreateProjectile('minipump', 0, Arena.height/2 + 10)
spawntimer = 0
bullets = {}

function Update()
    spawntimer = spawntimer + 1
    if spawntimer%15 == 0 then
        local posx = minipump.x
        local posy = minipump.y
        local bullet = CreateProjectile('bullet', posx, posy)
        bullet.SetVar('velx', 0)
        bullet.SetVar('vely', -2)
        table.insert(bullets, bullet)
    end
    
    for i=1,#bullets do
        local bullet = bullets[i]
        local velx = bullet.GetVar('velx')
        local vely = bullet.GetVar('vely')
        local newposx = bullet.x + velx
        local newposy = bullet.y + vely
        bullet.MoveTo(newposx, newposy)
        bullet.SetVar('vely', vely)
    end
	minipump.MoveTo(Player.x, Arena.height/2 + 10)
end