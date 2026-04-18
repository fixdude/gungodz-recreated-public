draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_font(fntS);
var s = 64 * res, d = 2 * res, p = 8 * res, q = 18 * res;

var xx = x + s + extend_x, yy = y + s;

draw_set_color(#474054);
draw_set_alpha(0.6);
draw_rectangle(x, y, xx, yy, false);
draw_set_alpha(1);

draw_set_color(#F0E898);
draw_rectangle(xx, y, xx + p, yy, false);
draw_text(xx - q, y + p, title);

draw_set_color(c_white);
draw_text(xx - q, y + (s / 2) + (d * 2), desc);
draw_sprite_stretched(achiev[ACH.SPR, 0], achiev[ACH.SPR, 1], x, y, s, s);