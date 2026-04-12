function scrInit()
{
	instance_create(0, 0, StatCont);

	with Start
	{
		with instance_create(x + 16, y + 16, Tile)
			scrTile();
	}

	scrWallPlanes();

	with Tile
		instance_destroy();

	with door
		solid = true;
	with bar
		solid = true;

	init = true;
	with BarrelPipe
		instance_destroy();
}