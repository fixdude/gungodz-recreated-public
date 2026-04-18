if !sphere_is_visible(x, y, z, 100)
{
	instance_destroy();
	exit;
}

glow = true;
size = 16;
image_speed = 0.5 fmt;
tt1 = sprite_get_texture(sprite_index, image_index);
z = 8;
ind = image_index;
