function scrCorpse()
{
	with instance_create(x, y, Corpse)
	{
		size = other.size;
		sprite_index = other.sprdead;
		image_speed = 0.2;
		friction = 0.2;
		motion_add(other.direction, other.speed);
		
		if BackCont.gold == false
		{
			if speed > 4
				speed = 4;
		}
		else
		{
			speed *= 1.5;
			
			if speed > 32
				speed = 32;
		}
		
		mask_index = other.mask_index;
	}
}
