var c = active ? c_white : c_black

draw_sprite_ext(sprLogoSplatters, -1, x, y, 1 - abs(sin(wave / 4) / 3), 1 - abs(sin(wave / 4) / 3), 0, c_white, 1);
draw_sprite_ext(sprLogoGuns, -1, x, y, 1 - abs(sin(wave) / 5), 1 - abs(sin(wave) / 5), 0, c_white, 1);
wave += (pi / 30);
draw_sprite_ext(sprLogoTriangle, -1, x, y, 1, 1, 0, c, 1);

if active == false
	exit;

if startoff > 0
{
	startoff -= 5 fmt;
	draw_sprite(sprLogoLeft, -1, x + 22 - startoff, y);
	draw_sprite(sprLogoRight, -1, x + 22 + startoff, y);
}
else
{
	if blink < 6
		blink += 0.5 fmt;
	
	draw_sprite(sprLogoAnim, wave / (pi / 30) / 5, x + 22, y);
}

draw_sprite(sprLogoEye, blink, x, y + 6);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fntS);
draw_text((room_width / 2) - 11, room_height - 20, string_hash_to_newline("PRESENTED BY VLAMBEER"/* AND VENUS PATROL"*/));