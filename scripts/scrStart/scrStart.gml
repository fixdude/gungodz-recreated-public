function scrStart()
{
	scrAchievement(ACHIEVEMENT.A1);
	scrAchievement(ACHIEVEMENT.A2);
	scrAchievement(ACHIEVEMENT.A3);
	scrAchievement(ACHIEVEMENT.A4);
	scrAchievement(ACHIEVEMENT.A5);
	scrAchievement(ACHIEVEMENT.A6);
	scrAchievement(ACHIEVEMENT.A7);
	scrAchievement(ACHIEVEMENT.A8);
	
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

	//UberCont.plays[UberCont.wld, UberCont.lev]++;
	instance_create(x + 16, y + 16, Player);
	instance_create(x, y, BackCont);

	var ind = string_char_at(string(room_get_name(room)), 4);
	if ind != string_digits(ind)
	|| real(ind) > 5 || ind == "0"
		ind = "1";
	
	var Ceiling = asset_get_index($"Ceil{ind}");
	var Back = asset_get_index($"Bak{ind}");
	if Ceiling == -1
		Ceiling = Ceil1;
	if Back == -1
		Back = Bak1;
	var sprDoor = asset_get_index($"sprDoor{ind}");
	var sprDoorSide = asset_get_index($"sprDoor{ind}Side");
	var sprDoorS = asset_get_index($"sprDoor{ind}S");
	var sprBar = asset_get_index($"sprBar{ind}");
	
	instance_create(x, y, Ceiling);
	instance_create(x, y, Back);
	BackCont.ttD = sprite_get_texture(sprDoorSide, 0);
	
	with door
	{
		tt1 = sprite_get_texture(sprDoor, 0);
		ttS = sprite_get_texture(sprDoorS, 0);
		uvs1 = sprite_get_uvs(sprDoor, 0);
		uvsS = sprite_get_uvs(sprDoorS, 0);
	}
	
	with bar
	{
		tt1 = sprite_get_texture(sprBar, 0);
		uvs1 = sprite_get_uvs(sprBar, 0);
	}
}