glow = false;
invincible = false;

if place_free(x + 16, y + 16)
{
	x += 16;
	y += 16;
}

image_speed = 0.4;
tt1 = sprite_get_texture(sprite_index, -1);
uvs1 = sprite_get_uvs(sprite_index, -1);
active = false;
aware = false;
target = 0;
angry = false;
my_dsound = sndEnemy1Die;
my_hsound = sndEnemy1Hit;
my_asound = sndEnemy1Alert;
size = 32;
width = 8;
z = 0;
can_shoot = true;
walk = false;
count_death = true;