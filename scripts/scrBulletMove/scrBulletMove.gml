function scrBulletMove()
{
	dist = 0;
	z = -2;
	
	with (bar)
		solid = false;
	
	do
	{
		x += lengthdir_x(1, direction);
		y += lengthdir_y(1, direction);
		z += (zspeed / 100);
		dist += 1;
	}
	until (
		!place_free(x + lengthdir_x(1, direction), y + lengthdir_y(1, direction))
		|| place_meeting(x, y, enemy)
		|| place_meeting(x, y, ExploBarrel)
		|| place_meeting(x, y, ChickDance)
		|| dist > 640
	);
	
	move_contact_solid(direction, 1);
	
	with (bar)
		solid = true;
}
