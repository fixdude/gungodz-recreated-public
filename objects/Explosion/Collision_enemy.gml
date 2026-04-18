if !other.invincible && !(other.object_index == GodExecute && other.image_speed > 0)
{
	if other.object_index != Tentacle
	{
		with other
		{
			if sprite_index != sprhurt
				sound_play(my_hsound);
			
			if alarm[0] > 1
				alarm[0] += 2 fmt;
			
			my_health -= 3;
			image_index = 0;
			sprite_index = sprhurt;
			active = true;
			motion_add(point_direction(other.x, other.y, x, y), 1 * kick fmt);
			
			with instance_create(x + random(2) - 1, y + random(2) - 1, BulletHitEnemy)
				z = 6 + random(4);
		}
	}
}
