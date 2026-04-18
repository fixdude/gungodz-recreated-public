var _next = false;

if grow == 1
{
	image_alpha += .1;
	
	if image_alpha > 1.2
		image_speed = .2;
}

if grow == 2
{
	image_alpha -= .1 fmt;
	
	if image_alpha < 0
		_next = true;
}


if InputPressed(INPUT_VERB.MENU_ACCEPT)
{
	InputVerbConsume(INPUT_VERB.MENU_ACCEPT);
	_next = true;
}

if _next
{
	d3d_end();
	
	if !instance_exists(UberCont)
		instance_create(x, y, UberCont);
	if !instance_exists(MusCont)
		instance_create(x, y, MusCont);
	
	if file_exists(working_directory + "gg.sav")
		scrLoad();
	
	room_goto(menLevelSelect);
}
