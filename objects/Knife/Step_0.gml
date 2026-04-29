if instance_exists(Player)
{
	image_angle = Player.angle;
	x = Player.x;
	y = Player.y;
}

if BackCont.evil == true && instance_exists(enemy)
{
	target = instance_nearest(x, y, enemy);
	Player.angle = point_direction(Player.x, Player.y, target.x, target.y);
	
	with (Player)
		move_contact_solid(point_direction(x, y, other.target.x, other.target.y), 10);
}
