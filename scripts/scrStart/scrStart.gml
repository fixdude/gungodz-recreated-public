function scrStart()
{
	if !instance_exists(LEVEL1)
		sound_play(sndElevatorOpen);

	with LEVEL5
	{
		dix = 0;
		diy = 0;
	
		repeat 10
		{
			instance_create(-16, diy, BarV);
			instance_create(room_width - 16, diy, BarV);
			instance_create(dix, -16, BarH);
			instance_create(dix, room_height - 16, BarH);
			dix += 32;
			diy += 32;
		}
	}

	//UberCont.plays[UberCont.wld, UberCont.lev] += 1;
	instance_create(x + 16, y + 16, Player);
	instance_create(x, y, BackCont);

	var ind = string_char_at(string(room_get_name(room)), 4);
	if ind == "2"
	{
		instance_create(x, y, Ceil2);
		instance_create(x, y, Bak2);
		BackCont.ttD = sprite_get_texture(sprDoor2Side, 0);
	
		with door
		{
			tt1 = sprite_get_texture(sprDoor2, 0);
			ttS = sprite_get_texture(sprDoor2S, 0);
		}
	
		with bar
			tt1 = sprite_get_texture(sprBar2, 0);
	}
	else if ind == "3"
	{
		instance_create(x, y, Ceil3);
		instance_create(x, y, Bak3);
		BackCont.ttD = sprite_get_texture(sprDoor3Side, 0);
	
		with door
		{
			tt1 = sprite_get_texture(sprDoor3, 0);
			ttS = sprite_get_texture(sprDoor3S, 0);
		}
	
		with bar
			tt1 = sprite_get_texture(sprBar3, 0);
	}
	else if ind == "4"
	{
		instance_create(x, y, Ceil4);
		instance_create(x, y, Bak4);
		BackCont.ttD = sprite_get_texture(sprDoor4Side, 0);
	
		with door
		{
			tt1 = sprite_get_texture(sprDoor4, 0);
			ttS = sprite_get_texture(sprDoor4S, 0);
		}
	
		with bar
			tt1 = sprite_get_texture(sprBar4, 0);
	}
	else if ind == "5"
	{
		instance_create(x, y, Ceil4);
		instance_create(x, y, Bak5);
		BackCont.ttD = sprite_get_texture(sprDoor4Side, 0);
	
		with door
		{
			tt1 = sprite_get_texture(sprDoor4, 0);
			ttS = sprite_get_texture(sprDoor4S, 0);
		}
	
		with bar
			tt1 = sprite_get_texture(sprBar5, 0);
	}
	else
	{
		instance_create(x, y, Ceil1);
		instance_create(x, y, Bak1);
		BackCont.ttD = sprite_get_texture(sprDoor1Side, 0);
	
		with door
		{
			tt1 = sprite_get_texture(sprDoor1, 0);
			ttS = sprite_get_texture(sprDoor1S, 0);
		}
	
		with bar
			tt1 = sprite_get_texture(sprBar1, 0);
	}
}