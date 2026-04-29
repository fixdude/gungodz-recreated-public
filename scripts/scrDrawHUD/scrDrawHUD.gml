function scrDrawHUD()
{
	var w = ceil(display_get_gui_width()), h = ceil(display_get_gui_height()) + 1;
	var m = w / 2;
	
	d3d_set_projection_ortho(0, 0, 320, 200, 0);
	d3d_set_fog(false, c_black, -10, 480);

	if Player.dead == false
	{
		var weapon = Player.weapons[Player.wep];
		var wepspr = weapon.sprite_index;
		var wepind = Player.gunanim;
		var wepy = Player.guny;
		
		if BackCont.gold == true
		{
			draw_sprite_ext(wepspr, abs(wepind), m + (sin(Player.walk / 20) * 4), h + wepy + credithudx, 1, 1, 0, make_color_rgb(222, 186, 84), 1);
			draw_set_blend_mode(bm_add);
			draw_sprite_ext(wepspr, abs(wepind), m + (sin(Player.walk / 20) * 4), h + wepy + credithudx, 1, 1, 0, c_yellow, 1);
			draw_sprite_ext(wepspr, abs(wepind), m + (sin(Player.walk / 20) * 4), h + wepy + credithudx, 1, 1, 0, c_white, 0.4);
			draw_sprite_ext(wepspr, abs(wepind), m + (sin(Player.walk / 20) * 4) + 1, h + wepy + credithudx, 1, 1, 0, c_white, 0.4);
			draw_sprite_ext(wepspr, abs(wepind), m + (sin(Player.walk / 20) * 4) - 1, h + wepy + credithudx, 1, 1, 0, c_white, 0.4);
			draw_set_blend_mode(bm_normal);
		}
		else
			draw_sprite(wepspr, abs(wepind), m + (sin(Player.walk / 20) * 4), h + wepy + credithudx);
	
		draw_set_color(c_red);
		draw_set_alpha(Player.red);
		draw_set_blend_mode(bm_add);
		draw_rectangle(0, 0, 320, 200, false);
		draw_set_blend_mode(bm_normal);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_set_font(fntM);
	
		if Player.win == true
			scrDrawVictory();
	
		kil = 0;
		kilmax = (instance_number(enemy) - instance_number(Prisoner));
		itm = 0;
		itmmax = instance_number(pickup);
		hit = 0;
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_left);
		draw_sprite(sprHUDHP, -1, 12 - credithudx, h - 10);
		draw_text(36 - credithudx, h - 2, string(Player.my_health));
		draw_set_halign(fa_right);
		amm = string(Player.ammo[Player.wep]);
	
		if Player.wep == 5
		{
			amm = string(Player.ammo[Player.knifewep]);
			draw_sprite(sprHUDAmmo, Player.knifewep, (w - 12) + credithudx, h - 10);
		}
		else
			draw_sprite(sprHUDAmmo, Player.wep, (w - 12) + credithudx, h - 10);
	
		draw_text((w - 36) + credithudx, h - 2, amm);
	}
	else
	{
		draw_set_color(c_red);
		draw_set_alpha(0.4);
		draw_set_blend_mode(bm_add);
		draw_rectangle(0, 0, w, h, false);
		draw_set_blend_mode(bm_normal);
		draw_set_alpha(1);
		draw_set_color(c_white);
	}

	with FadeIn
	{
		draw_set_color(c_black);
		draw_set_alpha(alpha);
		draw_rectangle(0, 0, w, h, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}

	with SUPERCREDITS
	{
		if back == 0
		{
			if alpha < 2
				alpha += 0.01;
			else
				back = 1;
		}
	
		if back == 1
		{
			if alpha > 0
				alpha -= 0.01 fmt;
			else
			{
				if thing < things
					thing++;
			
				if thing == things && !instance_exists(Credits)
					instance_create(0, 0, Credits);
			
				back = 0;
			}
		}
	
		draw_set_alpha(alpha - 0.2);
		draw_set_font(fntM);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_set_color(c_white);
		d3d_set_fog(false, c_black, -10, Player.hdr);
		draw_text(10, h - 10, string(text[thing]));
		d3d_set_fog(false, c_black, -10, Player.hdr);
		draw_set_alpha(1);
	}
}