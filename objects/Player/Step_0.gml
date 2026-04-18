if angle > 360
	angle -= 360;
if angle < 0
	angle += 360;

walk += speed;

if keyboard_check_pressed(vk_space)
	zspeed = 6;
	
if zspeed > -10
	zspeed -= 0.35;
	
z += zspeed;
if z < 16
	z = 16;

var dir = InputDirection(undefined, INPUT_CLUSTER.NAVIGATION, playerIndex);
if dir != undefined
{
	var dist = InputDistance(INPUT_CLUSTER.NAVIGATION);
	direction = angle + (dir - 90);
	if !place_meeting(x + lengthdir_x(1, direction), y + lengthdir_y(1, direction), wallParent)
		motion_add(direction, walkspeed * dist);
}

if friction < 0.5
	friction += 0.01 fmt;
else
	friction = 0.5;
	
if speed > 3
	speed = 3;

// indiegame wall clipping shenanigans, but that's ok
// i may fix the collision later.
if place_meeting(x, y, wallParent)
{
	/*
	if place_meeting(x, y, Wave)
	{
		sound_play(sndPlayerHit);
		scrDamagePlayer(1);
	}
	*/

	move_bounce_solid(true);
}

if is_desktop
	window_mouse_set_locked(window_has_focus());
if dead == false && UberCont.focus
{
	var d, v = (5 * (UberCont.sensitivity / 100));
	
	d = InputX(INPUT_CLUSTER.LOOKING, playerIndex);
	angle -= d / v;
	if UberCont.focus
	{
		d = window_mouse_get_delta_x();
		angle -= d / v;
	}
	d = InputY(INPUT_CLUSTER.LOOKING, playerIndex);
	angle_v -= d / v;
}