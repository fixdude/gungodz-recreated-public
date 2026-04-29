instance_destroy();

if enmhit == false
{
	sound_play(sndHitWall);
	
	with instance_create(x, y, BulletHit)
		z = other.z + 8;
}
