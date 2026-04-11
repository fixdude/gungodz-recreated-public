event_inherited();
scrAwareness();

if active == true
{
	if walk > 0
	{
		walk -= 1 fmt;
		
		if walk == round(walk)
		{
			if sprite_index != sprhurt && sprite_index != sprfire
				sprite_index = sprwalk;
			
			motion_add(direction, 1);
		}
	}
	else if sprite_index == sprwalk
		sprite_index = spridle;
	
	friction = 0.5;
	
	if speed > 1
		speed = 1;
}

tt1 = sprite_get_texture(sprite_index, -1);
