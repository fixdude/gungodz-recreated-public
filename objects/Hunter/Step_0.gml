event_inherited();
scrAwareness();

if active == true
{
	var los = scrLOS();
	if walk > 0
	{
		if sprite_index != sprhurt && sprite_index != sprfire
			sprite_index = sprwalk;
		
		walk -= 1 fmt;
		motion_add(direction, 1);
		
		if angry == true && target != noone
		{
			if los
			{
				lastx = target.x;
				lasty = target.y;
			}
			else
				motion_addf(point_direction(x, y, lastx, lasty), 0.3);
			
			if walk < 15
				walk = 15;
		}
	}
	else if sprite_index == sprwalk
		sprite_index = spridle;
	
	friction = 0.5;
	
	if speed > 1.5
		speed = 1.5;
}

if distance_to_object(Rocket) < 200
{
	var rok = instance_nearest(x, y, Rocket);
	motion_addf(point_direction(rok.x, rok.y, x, y), 0.4);
}

if target != noone
{
	if angry == true && can_shoot == true && random(2) < 1
	&& point_distance(x, y, target.x, target.y) > 40 && point_distance(x, y, target.x, target.y) < 600
	&& los && collision_line(x, y, target.x, target.y, enemy, true, true) < 0 && sprite_index != sprhurt
	{
		glow = true;
		alarm[5] = 5;
		sound_play(sndFireBall);
		
		with instance_create(x, y, FireBall)
		{
			direction = (point_direction(x, y, other.target.x, other.target.y) + random(12)) - 6;
			speed = 4;
		}
		
		walk = 0;
		can_shoot = false;
		alarm[0] = 10;
		image_index = 0;
		sprite_index = sprfire;
	}
}

tt1 = sprite_get_texture(sprite_index, image_index);
