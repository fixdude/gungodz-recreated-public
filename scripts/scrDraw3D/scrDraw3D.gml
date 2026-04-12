function scrDraw3d()
{
	with Bak
	{
		if instance_exists(LEVEL5)
			d3d_draw_floor(-96, -96, z, room_width + 96, room_height + 96, z, tt1, 1, 1);
		else
			d3d_draw_floor(32, 32, z, room_width - 32, room_height - 32, z, tt1, (room_width / 64) - 1, (room_height / 64) - 1);
	}

	with Ceil
	{
		if !instance_exists(LEVEL5)
			d3d_draw_floor(32, 32, z, room_width - 32, room_height - 32, z, tt1, (room_width / 64) - 1, (room_height / 64) - 1);
	}

	draw_set_color(c_ltgray);

	with WallPlaneV
	{
		if h != 3
			d3d_draw_wall(x1, y1, 32, x2, y2, 0, tt1, 1, 1);
	
		if h == 2
			d3d_draw_wall(x1, y1, 64, x2, y2, 32, tt2, 1, 1);
	}

	with DoorV
	{
		d3d_draw_wall(x + 14, y, 32, x + 14, y + 32, 0, tt1, 1, 1);
		d3d_draw_wall(x + 18, y, 32, x + 18, y + 32, 0, tt1, 1, 1);
	}

	with DoorH
	{
		d3d_draw_wall(x, y, 32, x, y + 32, 0, ttS, 1, 1);
		d3d_draw_wall(x + 32, y, 32, x + 32, y + 32, 0, ttS, 1, 1);
	}

	with BarV
		d3d_draw_wall(x + 16, y, 32, x + 16, y + 32, 0, tt1, 1, 1);

	with SecretWallH
		d3d_draw_wall(x + 32, y, 32, x + 32, y + 32, 0, tt1, 1, 1);

	draw_set_color(c_white);

	with Pipe
		d3d_draw_floor(x, y, 32, x + 32, y + 32, 32, tt3, 1, 1);

	with Bar1Stuk
		d3d_draw_wall(x, y, 32, x + 32, y, 0, tt1, 1, 1);

	with SecretWall
		d3d_draw_wall(x, y, 32, x + 32, y, 0, tt1, 1, 1);

	with SecretWall4
	{
		d3d_draw_wall(x, y + 32, 64, x + 32, y + 32, 32, tt2, 1, 1);
		d3d_draw_wall(x, y + 32, 32, x + 32, y + 32, 0, tt1, 1, 1);
	}

	with WallPlaneH
	{
		d3d_draw_wall(x1, y1, 32, x2, y2, 0, tt1, 1, 1);
	
		if h == 2
			d3d_draw_wall(x1, y1, 64, x2, y2, 32, tt2, 1, 1);
	}

	with DoorH
	{
		d3d_draw_wall(x, y + 14, 32, x + 32, y + 14, 0, tt1, 1, 1);
		d3d_draw_wall(x, y + 18, 32, x + 32, y + 18, 0, tt1, 1, 1);
	}

	with DoorV
	{
		d3d_draw_wall(x, y, 32, x + 32, y, 0, ttS, 1, 1);
		d3d_draw_wall(x, y + 32, 32, x + 32, y + 32, 0, ttS, 1, 1);
	}

	with BarH
		d3d_draw_wall(x, y + 16, 32, x + 32, y + 16, 0, tt1, 1, 1);

	with plane
	{
		if glow == 1
			d3d_set_fog(false, c_black, -10, Player.hdr);
	
		d3d_draw_wall(
		x + lengthdir_x(size / 2, other.angle + 90),
		y + lengthdir_y(size / 2, other.angle + 90),
		size + z,
		x + lengthdir_x(size / 2, other.angle - 90),
		y + lengthdir_y(size / 2, other.angle - 90),
		z,
		tt1, 1, 1);
	
		if glow == 1 && Player.fog == 1
			d3d_set_fog(true, c_black, -10, Player.hdr);
	}

	with Exit
	{
		d3d_draw_floor(x, y, 0.05, x + 32, y + 32, 0.05, ttF, 1, 1);
		d3d_draw_floor(x, y, 31.95, x + 32, y + 32, 31.95, ttC, 1, 1);
	}

	if !instance_exists(LEVEL1) && !instance_exists(LEVEL5)
	{
		with Start
		{
			d3d_draw_floor(x, y, 0.05, x + 32, y + 32, 0.05, ttF, 1, 1);
			d3d_draw_floor(x, y, 31.95, x + 32, y + 32, 31.95, ttC, 1, 1);
		}
	}
}