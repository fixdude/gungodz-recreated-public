function scrWallPlanes()
{
	with Wall
	{
		tt1 = sprite_get_texture(sprite_index, 0);
		tt2 = sprite_get_texture(sprite_index, 1);
	
		if place_free(x, y - 1) && place_meeting(x, y - 1, Tile)
		{
			with instance_create(x, y, WallPlaneH)
			{
				x1 = round(x);
				y1 = round(y);
				x2 = round(x + 32);
				y2 = round(y);
				tt1 = other.tt1;
				tt2 = other.tt2;
				h = other.h;
			
				if place_meeting(x, y - 2, DoorV)
					tt1 = BackCont.ttD;
			
				if place_meeting(x, y - 1, Pipe)
				{
					tt1 = sprite_get_texture(sprPipe, 1);
					h = 1;
				}
			
				if place_meeting(x, y - 1, BarrelPipe)
				{
					tt1 = sprite_get_texture(sprBarrelSide, 1);
					h = 1;
				}
			
				if place_meeting(x, y - 1, Exit)
				|| (place_meeting(x, y - 1, Start) && !instance_exists(LEVEL1))
				{
					tt1 = sprite_get_texture(tilExitWall, 0);
					h = 1;
				}
			
				if place_meeting(x, y - 1, Start) && instance_exists(LEVEL5)
				{
					tt1 = sprite_get_texture(sprWall5_2, 0);
					h = 1;
				}
			}
		}
	
		if place_free(x, y + 1) && place_meeting(x, y + 1, Tile)
		{
			with instance_create(x, y, WallPlaneH)
			{
				x1 = round(x);
				y1 = round(y + 32);
				x2 = round(x + 32);
				y2 = round(y + 32);
				tt1 = other.tt1;
				tt2 = other.tt2;
				h = other.h;
			
				if place_meeting(x, y + 2, DoorV)
					tt1 = BackCont.ttD;
			
				if place_meeting(x, y + 1, Pipe)
				{
					tt1 = sprite_get_texture(sprPipe, 1);
					h = 1;
				}
			
				if place_meeting(x, y + 1, BarrelPipe)
				{
					tt1 = sprite_get_texture(sprBarrelSide, 1);
					h = 1;
				}
			
				if place_meeting(x, y + 1, Exit)
				|| (place_meeting(x, y + 1, Start) && !instance_exists(LEVEL1) && !instance_exists(LEVEL5))
				{
					tt1 = sprite_get_texture(tilExitWall, 1);
					h = 1;
				}
			}
		}
	
		if place_free(x - 1, y) && place_meeting(x - 1, y, Tile)
		{
			with instance_create(x, y, WallPlaneV)
			{
				x1 = round(x);
				y1 = round(y);
				x2 = round(x);
				y2 = round(y + 32);
				tt1 = other.tt1;
				tt2 = other.tt2;
				h = other.h;
			
				if place_meeting(x - 2, y, DoorH)
					tt1 = BackCont.ttD;
			
				if place_meeting(x - 1, y, Pipe)
				{
					tt1 = sprite_get_texture(sprPipe, 1);
					h = 1;
				}
			
				if place_meeting(x - 1, y, BarrelPipe)
				{
					tt1 = sprite_get_texture(sprBarrelSide, 1);
					h = 1;
				}
			
				if place_meeting(x - 1, y, Exit)
				|| (place_meeting(x - 1, y, Start) && !instance_exists(LEVEL1) && !instance_exists(LEVEL5))
				{
					tt1 = sprite_get_texture(tilExitWall, 2);
					h = 1;
				}
			}
		}
	
		if place_free(x + 1, y) && place_meeting(x + 1, y, Tile)
		{
			with instance_create(x, y, WallPlaneV)
			{
				x1 = round(x + 32);
				y1 = round(y);
				x2 = round(x + 32);
				y2 = round(y + 32);
				tt1 = other.tt1;
				tt2 = other.tt2;
				h = other.h;
			
				if place_meeting(x + 2, y, DoorH)
					tt1 = BackCont.ttD;
			
				if place_meeting(x + 1, y, Pipe)
				{
					tt1 = sprite_get_texture(sprPipe, 1);
					h = 1;
				}
			
				if place_meeting(x + 1, y, BarrelPipe)
				{
					tt1 = sprite_get_texture(sprBarrelSide, 1);
					h = 1;
				}
			
				if place_meeting(x + 1, y, Exit)
				|| (place_meeting(x + 1, y, Start) && !instance_exists(LEVEL1) && !instance_exists(LEVEL5))
				{
					tt1 = sprite_get_texture(tilExitWall, 3);
					h = 1;
				}
			}
		}
	}

	//scrPipePlanes();
	//scrExitPlanes();

	//if !instance_exists(LEVEL1)
	//	scrStartPlanes();
}