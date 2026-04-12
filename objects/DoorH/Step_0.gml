if instance_exists(Player)
{
	if point_distance(x + 16, y + 16, Player.x, Player.y) < 32 && move == false
	{
		sound_play(sndDoor);
		move = true;
		alarm[0] = 30;
		hspeed = 1;
	}
}
