function scrTile()
{
	if !place_meeting(x - 32, y, Wall) && !place_meeting(x - 32, y, Tile) && x > 0
	{
		with instance_create(x - 32, y, Tile)
			scrTile();
	}

	if !place_meeting(x + 32, y, Wall) && !place_meeting(x + 32, y, Tile) && x < room_width
	{
		with instance_create(x + 32, y, Tile)
			scrTile();
	}

	if !place_meeting(x, y - 32, Wall) && !place_meeting(x, y - 32, Tile) && y > 0
	{
		with instance_create(x, y - 32, Tile)
			scrTile();
	}

	if !place_meeting(x, y + 32, Wall) && !place_meeting(x, y + 32, Tile) && y < room_height
	{
		with instance_create(x, y + 32, Tile)
			scrTile();
	}
}