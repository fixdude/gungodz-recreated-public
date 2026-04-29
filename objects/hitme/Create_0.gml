event_inherited();

glow = false;
invincible = false;

if place_free(x + 16, y + 16)
{
	x += 16;
	y += 16;
}

size = 32;
width = 8;
z = 0;
tt1 = sprite_get_texture(sprite_index, -1);
my_dsound = sndEnemy1Die;
my_hsound = sndEnemy1Hit;
my_asound = sndEnemy1Alert;
count_death = false;
my_health = 1;