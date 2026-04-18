var mx = InputMouseGuiX(), my = InputMouseGuiY();
if InputMousePressed(mb_left)
&& x > mx && y > my && x < mx + sprite_width && y < my + sprite_height
{
	UberCont.lev = lev;
	UberCont.wld = wld;
	
	with UberCont
	{
		p_gun = Weapons.Pistol;
		p_ammo = [20, 0, 0, 0];
	}
	
	var mus = asset_get_index("sndLEVEL" + string(wld));
	if mus != -1
		scrMusic(mus);

	window_mouse_set(window_get_width() / 2, window_get_height() / 2);
	var roomName = $"lev{wld}_{lev}";
	if wld == 4 && lev == 3
		roomName = "lev5_1";
	
	var roomId = asset_get_index(roomName);
	if roomId != -1
		room_goto(roomId);
}