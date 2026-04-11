function scrLOS()
{
	if target != 0
	{
		return (collision_line(x, y, target.x, target.y, wallParent, true, true) < 0)
		|| (collision_line(x + lengthdir_x(width, Player.angle + 90), y + lengthdir_y(width, Player.angle + 90), target.x, target.y, wallParent, true, true) < 0)
		|| (collision_line(x + lengthdir_x(width, Player.angle - 90), y + lengthdir_y(width, Player.angle - 90), target.x, target.y, wallParent, true, true) < 0)
	}
}