size = 16;
z = 0;
x += 16;
y += 16;

var ind = string_char_at(string(room_get_name(room)), 4) == "2";
tt1 = sprite_get_texture(sprite_index, ind);
uvs1 = sprite_get_uvs(sprite_index, ind);

event_inherited();
