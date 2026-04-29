wave = 0;
tvoff = 3;
thoff = 3;
alarm[0] = 90;
alpha = -0.1;
d3d_end();
scrLevels();
x = (room_width / 2) - 11;
y = room_height / 2;
dix = 1;
diy = 1;
stars = 0;

repeat NUM_WORLDS
{
	repeat NUM_LEVELS
	{
		stars += UberCont.stars[diy, dix];
		dix += 1;
	}
	
	dix = 1;
	diy += 1;
}

// TODO: replace with save/load instead of calculating everytime
if stars >= 10
	UberCont.unlok[1, 4] = true;
if stars >= 20
	UberCont.unlok[2, 4] = true;
if stars >= 30
	UberCont.unlok[3, 4] = true;
if stars >= 40
	UberCont.unlok[4, 4] = true;

dix = (room_width / 2) - 104;
diy = 32;
wld = 1;
lev = 1;

repeat NUM_WORLDS
{
	repeat NUM_LEVELS
	{
		with instance_create(dix, diy, LevelButton)
		{
			fog = other.l_info[wld, 0];
			wld = other.wld;
			lev = other.lev;
		}
		
		lev++;
		dix += 52;
	}
	
	dix = (room_width / 2) - 104;
	diy += 32;
	wld++;
	lev = 1;
}

instance_create((room_width / 2) - 104, diy, CreditsButton);
instance_create((room_width / 2) - 52, diy, RemapButton);

if UberCont.beats[4, 3] > 0
	instance_create(room_width / 2, diy, GoldToggle);

scrSave();
