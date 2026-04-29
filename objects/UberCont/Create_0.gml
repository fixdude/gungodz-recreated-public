if use_steam
	steam_on = steam_initialised();

// Player variables
p_health = 100;
p_gun = Weapons.Pistol;
p_ammo = [0, 20, 0, 0, 0];
tim = 0;
totalkills = 0;
totalstars = 0;
global.scrn_num = 0;
scrLevels();
lev = 1;
wld = 1;
sensitivity = 100;
focus = true;

cursor = false;
if use_native_cursor
{
	cur = native_cursor_create_from_sprite(sprCursor);
	native_cursor_set(cur);
	cursor = true;
}

scr_startAchievements();

repeat NUM_WORLDS
{
	repeat NUM_LEVELS
	{
		plays[wld, lev] = 0;
		beats[wld, lev] = 0;
		kills[wld, lev] = 0;
		items[wld, lev] = 0;
		times[wld, lev] = 0;
		stars[wld, lev] = 0;
		unlok[wld, lev] = 0;
		lev++;
	}
	
	wld++;
	lev = 1;
}

unlok[1, 1] = 1;
gotgold = false;
gold = false;
hard = false;
musicon = 1;
achievQueue = ds_queue_create();

Screen.captionConfig.icon.sprite_index = sprIco;