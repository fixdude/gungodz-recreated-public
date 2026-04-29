function scrFire(weapon, typ)
{
	if ammo[wep] == 0
	{
		if typ == 0
			sound_play(sndEmpty);
		return false;
	}
	
	var fired = false;
	if can_shoot == true && ammo[wep] > 0
	{
		var gold = BackCont.gold;
		if typ == 0 && weapon.press != noone
			fired = weapon.press(id, gold);
		if typ == 1 && weapon.hold != noone
			fired = weapon.hold(id, gold);
		if typ == 2 && weapon.released != noone
			fired = weapon.released(id, gold);
			
		if fired == true
		{
			if gold
				scrShake(weapon.goldshake);
				
			can_shoot = false;
			ammo[wep] -= weapon.cost;
			alarm[0] = weapon.reload fmt;
		}
	}
	return fired;
}
