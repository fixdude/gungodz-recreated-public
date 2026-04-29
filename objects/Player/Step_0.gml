if place_meeting(x, y, Pipe) || place_meeting(x, y, BarrelPipe)
	hdr -= (hdr - (global.fog * 0.6)) * 0.2;
else if (BackCont.night <= 0)
	hdr -= (hdr - global.fog) * 0.2;
else
	hdr -= (hdr - max(1, global.fog - (BackCont.night * 50))) * 0.2;

if angle > 360
	angle -= 360;
if angle < 0
	angle += 360;

walk += speed;

/*
if keyboard_check_pressed(vk_space)
	zspeed = 6;
if zspeed > -10
	zspeed -= 0.35;
*/
	
z += zspeed;
if z < 16
	z = 16;

var dir = InputDirection(undefined, INPUT_CLUSTER.NAVIGATION, playerIndex);
if dir != undefined
{
	var dist = InputDistance(INPUT_CLUSTER.NAVIGATION);
	direction = angle + (dir - 90);
	if !place_meeting(x + lengthdir_x(1, direction), y + lengthdir_y(1, direction), wallParent)
		motion_addf(direction, walkspeed * dist);
}

if friction < 0.5
	friction += 0.01 fmt;
else
	friction = 0.5;
	
if speed > 3
	speed = 3;

// indiegame wall clipping shenanigans, but that's ok
// i may fix the collision later.
if place_meeting(x, y, wallParent)
{
	/*
	if place_meeting(x, y, Wave)
	{
		sound_play(sndPlayerHit);
		scrDamagePlayer(1);
	}
	*/

	move_bounce_solid(true);
}

if is_desktop
	window_mouse_set_locked(window_has_focus());
if dead == false && UberCont.focus
{
	var d, v = (5 * (UberCont.sensitivity / 100));
	
	d = InputX(INPUT_CLUSTER.LOOKING, playerIndex);
	angle -= d / v;
	if window_mouse_get_locked()
	{
		d = window_mouse_get_delta_x();
		angle -= d / v;
	}
	d = InputY(INPUT_CLUSTER.LOOKING, playerIndex);
	angle_v -= d / v;
}

if nextwep != Weapons.None && can_shoot == true
{
	guny += 24;
	
	if guny > 96
	{
		wep = nextwep;
		gunanim = 0;
		nextwep = Weapons.None;
	}
}

if nextwep == Weapons.None && guny > 0
	guny -= 24;

if dead == true
{
	deadtime += 1 fmt;
	
	if deadtime > 60 && (InputPressed(INPUT_VERB.SHOOT) || InputPressed(INPUT_VERB.MENU_ACCEPT))
		room_restart();
}

if dead == false && win == false
{
	if InputReleased(INPUT_VERB.NEXT_WEAPON) || wep == Weapons.None
	{
		if wep != Weapons.Knife
		{
			if guny == 0
			{
				dir = 0;
				nextwep = wep;
			
				do
				{
					if nextwep < Weapons.Knife
						nextwep++;
					else
						nextwep = 1;
				
					dir++;
				}
				until (ammo[nextwep] > 0 || dir > Weapons.Knife);
			}
		
			if nextwep == wep || ammo[nextwep] == 0
				nextwep = 0;
		}
		if wep == Weapons.None
			wep = Weapons.Pistol;
	}
	
	var weapon = weapons[wep];
	if wep != Weapons.None
	{
		if gunanim > 0
			gunanim -= weapon.image_speed;
		else
		{
			gunanim = 0;
		
			if wep == Weapons.Knife
				wep = knifewep;
		}
	}
	
	if InputPressed(INPUT_VERB.SHOOT)
		scrFire(weapon, 0);
		
	if InputCheck(INPUT_VERB.SHOOT)
	{
		if nextwep != Weapons.None
		{
			wep = nextwep;
			gunanim = 0;
			nextwep = 0;
		}
		
		scrFire(weapon, 1);
	}
	
	if InputReleased(INPUT_VERB.SHOOT)
		scrFire(weapon, 2);
		
	if InputPressed(INPUT_VERB.MELEE)
	{
		if wep != Weapons.Knife && can_shoot == true
		{
			knifewep = wep;
			if knifewep == Weapons.Knife
				knifewep = Weapons.None;

			wep = Weapons.Knife;
			scrFire(weapons[Weapons.Knife], 0);
		}
	}
}