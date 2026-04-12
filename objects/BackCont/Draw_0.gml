if evil == true
{
	draw_set_blend_mode(choose(bm_add, bm_subtract, bm_subtract));
	//__background_set_colour(-1);
}

if init == true
{
	angle = Player.angle;
	if oldskool == true
		angle = round(angle / 90) * 90;
	
	/*
	if instance_exists(LEVEL4) || instance_exists(LEVEL5)
	{
		d3d_set_fog(false, c_black, -10000, 10000);
		d3d_set_hidden(0);
		draw_sprite_ext(bakSky4, 0, (Player.angle / 360) * 640, 0, 1, 1, 0, c_white, 1);
		draw_sprite_ext(bakSky4, 0, ((Player.angle / 360) * 640) - 640, 0, 1, 1, 0, c_white, 1);
		draw_sprite_ext(bakSky4, 0, ((Player.angle / 360) * 640) - 1280, 0, 1, 1, 0, c_white, 1);
		
		if UberCont.wld == 4 && UberCont.lev == 3 && instance_exists(Player)
		{
			if Player.win == 1
			{
				with pickup
					glow = 0;
				
				night += 0.005;
				
				if night > 2
					credithudx += 4;
				
				if night > 13 && !instance_exists(SUPERCREDITS)
					instance_create(0, 0, SUPERCREDITS);
				
				draw_background_ext(221, (Player.angle / 360) * 640, 0, 1, 1, 0, c_white, night / 2);
				draw_background_ext(221, ((Player.angle / 360) * 640) - 640, 0, 1, 1, 0, c_white, night / 2);
				draw_background_ext(221, ((Player.angle / 360) * 640) - 1280, 0, 1, 1, 0, c_white, night / 2);
			}
		}
		
		d3d_set_hidden(true);
	}
	*/
	
	with Player
		d3d_set_fog(fog, c_black, -10, hdr);
	
	xshake = random(shake) - (shake / 2);
	yshake = random(shake) - (shake / 2);
	zshake = random(shake) - (shake / 2);
	
	if shake > 0
	{
		shake *= 0.9;
		shake -= 0.05;
	}
	else
		shake = 0;
	
	if oldskool == true
		d3d_set_projection_ext(
			(round((Player.x - 16) / 32) * 32) + 16 + xshake,
			(round((Player.y - 16) / 32) * 32) + 16 + yshake,
			Player.z + sin(Player.walk / 10) + zshake,
			(round((Player.x - 16) / 32) * 32) + 16 + lengthdir_x(64, angle) + xshake,
			(round((Player.y - 16) / 32) * 32) + 16 + lengthdir_y(64, angle) + yshake,
			16 + sin(Player.walk / 10) + zshake,
			Player.tilt, 0, 1, 60, 1.6, 1, 10000);
	else
		d3d_set_projection_ext(
			Player.x + xshake, Player.y + yshake, Player.z + sin(Player.walk / 10) + zshake + max(0, (BackCont.night * 10) - 100),
			Player.x + lengthdir_x(64, angle) + xshake, Player.y + lengthdir_y(64, angle) + yshake, 16 + sin(Player.walk / 10) + zshake + max(0, (BackCont.night * 10) - 100),
			Player.tilt, 0, 1, 60, 1.6, 1, 10000);
	
	scrDraw3d();
	scrDrawHUD();
}
