other.ammo[index] += add_ammo;
other.nextwep = index;
instance_destroy();
sound_play(sndPickupGun);
with StatCont
	itm++;

if is_string(achiev)
{
	if steam_on
		steam_set_achievement(achiev);
}