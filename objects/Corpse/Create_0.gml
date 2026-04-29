event_inherited();
tt1 = sprite_get_texture(sprite_index, image_index);

if string_char_at(string(room_get_name(room)), 4) == "2"
{
	float = 0.01;
	z = 2 + sin(float);
}
else
{
	float = 0;
	z = 0;
}
