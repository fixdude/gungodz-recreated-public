function scrSetSpriteAlpha(dest_spr, src_spr)
{
	var dest = sprite_duplicate(dest_spr), src = sprite_duplicate(src_spr);
	sprite_set_alpha_from_sprite(dest, src);
	sprite_delete(src);
	return dest;
}
