draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

with LevelButton
{
	var level = other.l_info[wld, lev];
	draw_self();
	
	if UberCont.beats[wld, lev] <= 0
	{
		image_index -= image_speed;
		draw_sprite(sprLevelNotBeat, -1, x, y);
	}
	
	draw_set_font(fntS);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	
	var unlocked = UberCont.unlok[wld, lev];
	if unlocked == true
	{
		draw_text_ext(x + other.thoff, y + other.tvoff, string_hash_to_newline(level.name), 5, 100);
	
		dir = 0;
		repeat UberCont.stars[wld, lev]
		{
			draw_sprite(sprStar, 0, x + 2 + dir, y + 13);
			if dir >= 18
				draw_sprite(sprStar, 1, x + 2 + dir, y + 13);
			dir += 6;
		}
		
		dir = 0;
		repeat 3
		{
			draw_sprite_ext(sprStar, 0, x + 2 + dir, y + 13, 1, 1, 0, c_white, 0.4);
			dir += 6;
		}
	}
	else
		draw_sprite_ext(sprLevelNotBeat, -1, x, y, 1, 1, 0, c_black, 0.9);
	
	if (unlocked == true && UberCont.plays[wld, lev] == 0)
	|| (wld == 4 && lev == 4 && other.stars == 52)
		draw_sprite(sprNew, -1, x + 39, y);
	
	if lev == 4 && unlocked == false
	{
		draw_text(x + 7, y + 1, string(wld * 10));
		draw_sprite(sprStar, 0, x + 1, y + 2);
	}
}

draw_set_font(fntS);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
	
with CreditsButton
{
	draw_sprite(sprite_index, -1, x, y);
	draw_text(x + other.thoff, y + other.tvoff, "CREDITZ");
}

with RemapButton
{
	draw_sprite(sprite_index, -1, x, y);
	draw_text_ext(x + other.thoff, y + other.tvoff, "CONTROLS", 0, 52);
}

draw_set_color(c_white);
draw_set_font(fntS);
draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
var str = string(stars) + "/52";
draw_text(room_width - 3, 8, str);
draw_sprite(sprStar, 1, room_width - 10 - string_width(str), 4);

if !use_native_cursor && UberCont.focus == true
	draw_sprite(sprCursor, -1, InputMouseGuiX(), InputMouseGuiY());
