function scrDraw3d()
{
	with (Bak)
	{
		if instance_exists(LEVEL5)
			d3d_draw_floor(-96, -96, z, room_width + 96, room_height + 96, z, tt1, 1, 1);
		else
			d3d_draw_floor(32, 32, z, room_width - 32, room_height - 32, z, tt1, (room_width / 64) - 1, (room_height / 64) - 1);
	}

	with (Ceil)
	{
		if !instance_exists(LEVEL5)
			d3d_draw_floor(32, 32, z, room_width - 32, room_height - 32, z, tt1, (room_width / 64) - 1, (room_height / 64) - 1);
	}

	draw_set_color(c_ltgray);

	with (WallPlaneV)
	{
		if h != 3
			d3d_draw_wall_simple(x1, y1, 32, x2, y2, 0, tt1);
	
		if h == 2
			d3d_draw_wall_simple(x1, y1, 64, x2, y2, 32, tt2);
	}

	with (DoorV)
	{
		d3d_draw_wall_simple(x + 14, y, 32, x + 14, y + 32, 0, tt1);
		d3d_draw_wall_simple(x + 18, y, 32, x + 18, y + 32, 0, tt1);
	}

	with (DoorH)
	{
		d3d_draw_wall_simple(x, y, 32, x, y + 32, 0, ttS);
		d3d_draw_wall_simple(x + 32, y, 32, x + 32, y + 32, 0, ttS);
	}

	with (BarV)
		d3d_draw_wall_simple(x + 16, y, 32, x + 16, y + 32, 0, tt1);

	with (SecretWallH)
		d3d_draw_wall_simple(x + 32, y, 32, x + 32, y + 32, 0, tt1);

	draw_set_color(c_white);

	with (Pipe)
		d3d_draw_floor_simple(x, y, x + 32, y + 32, 32, tt3);

	with (Bar1Stuk)
		d3d_draw_wall_simple(x, y, 32, x + 32, y, 0, tt1);

	with (SecretWall)
		d3d_draw_wall_simple(x, y, 32, x + 32, y, 0, tt1);

	with (SecretWall4)
	{
		d3d_draw_wall_simple(x, y + 32, 64, x + 32, y + 32, 32, tt2);
		d3d_draw_wall_simple(x, y + 32, 32, x + 32, y + 32, 0, tt1);
	}

	with (WallPlaneH)
	{
		d3d_draw_wall_simple(x1, y1, 32, x2, y2, 0, tt1);
	
		if h == 2
			d3d_draw_wall_simple(x1, y1, 64, x2, y2, 32, tt2);
	}

	with (DoorH)
	{
		d3d_draw_wall_simple(x, y + 14, 32, x + 32, y + 14, 0, tt1);
		d3d_draw_wall_simple(x, y + 18, 32, x + 32, y + 18, 0, tt1);
	}

	with (DoorV)
	{
		d3d_draw_wall_simple(x, y, 32, x + 32, y, 0, ttS);
		d3d_draw_wall_simple(x, y + 32, 32, x + 32, y + 32, 0, ttS);
	}

	with (BarH)
		d3d_draw_wall_simple(x, y + 16, 32, x + 32, y + 16, 0, tt1);

	with (plane)
	{
		if glow == true
			d3d_set_fog(false, c_black, -10, Player.hdr);
			
		d3d_draw_wall_simple(
		x + lengthdir_x(size / 2, other.angle + 90),
		y + lengthdir_y(size / 2, other.angle + 90),
		size + z,
		x + lengthdir_x(size / 2, other.angle - 90),
		y + lengthdir_y(size / 2, other.angle - 90),
		z,
		tt1);
	
		if glow == true
		&& Player.fog == true
			d3d_set_fog(true, c_black, -10, Player.hdr);
	}

	with (Exit)
	{
		d3d_draw_floor_simple(x, y, x + 32, y + 32, 0.05, ttF);
		d3d_draw_floor_simple(x, y, x + 32, y + 32, 31.95, ttC);
	}

	if !instance_exists(LEVEL1) && !instance_exists(LEVEL5)
	{
		with (Start)
		{
			d3d_draw_floor_simple(x, y, x + 32, y + 32, 0.05, ttF);
			d3d_draw_floor_simple(x, y, x + 32, y + 32, 31.95, ttC);
		}
	}
}
