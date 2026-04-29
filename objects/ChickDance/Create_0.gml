event_inherited();
x += 16;
y += 16;
tt1 = sprite_get_texture(sprite_index, 0);
size = 32;
z = 0;
image_speed = 0.2;
stars = 0;
dix = 1;
diy = 1;

repeat (4)
{
	repeat (4)
	{
		stars += UberCont.stars[diy][dix];
		dix += 1;
	}
	
	dix = 1;
	diy += 1;
}

if (stars < 52)
{
	instance_destroy();
	instance_create(xstart, ystart, Chick);
}
