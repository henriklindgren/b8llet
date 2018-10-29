pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
SCREEN_SIZE = 128
SPRITE_SIZE = 8
direction = {}
direction.left = 0
direction.right = 1
direction.up = 2
direction.down = 3
direction.none = 4
player = {}
player.x = 120
player.y = 120
player.sprite = 1
player.bullet_sprite = 2
player.speed = 1
player.moving = direction.none
player.reload = 0
bullets = {}
bullets.sprite = 2
bullets.speed = 1
bullets.reload = 14
shots = {}
function _draw()
	cls()
	spr(player.sprite, player.x, player.y)
	for i=1, #shots do
		local shot = shots[i]
		spr(bullets.sprite, shot[1], shot[2])
	end
end
function _update()
	player.moving = direction.none
	if player.reload > 0 then
		player.reload -= 1
	end
	if btn(0) then
		player.moving = direction.left
	elseif btn(1) then
		player.moving = direction.right
	elseif btn(2) then
		-- up
	elseif btn(3) then
		-- down
	end
	if btn(4) then
		-- Z
	end
	if btn(5) and player.reload == 0 then
		-- X
		shots[#shots + 1] = {player.x, player.y}
		player.reload = bullets.reload
	end
	for shot_index=1, #shots do
		local shot = shots[shot_index]
		shots[shot_index] = {shot[1], shot[2] - bullets.speed}
	end
	if player.moving == direction.left then
		player.x -= player.speed		
	elseif player.moving == direction.right then
		player.x += player.speed
		
	end
	if player.x > SCREEN_SIZE - SPRITE_SIZE then
		player.x = SCREEN_SIZE - SPRITE_SIZE
	elseif player.x < 0 then
		player.x = 0
	end
end
__gfx__
000000000000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000bbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000bbb00000bb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000bbbbb0000bb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000bbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000bbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000b000b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000bb0000b0000b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb0bbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb00bbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000bb000000bb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000bb000000bb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000bb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0013000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000007040070300703007030070300703007040080400804008040080400a0400b0400c0400c0400d0400e040100501005000050000500006000000000000000000000000000000000000000000000000000
