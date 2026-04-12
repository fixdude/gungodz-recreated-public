if angle > 360
	angle -= 360;
if angle < 0
	angle += 360;

walk += speed;

var d = InputDirection(undefined, INPUT_CLUSTER.NAVIGATION, playerIndex);
if d != undefined
{
	direction = angle + (d - 90);
	motion_add(direction, 1);
}

if friction < 0.5
	friction += 0.01;
else
	friction = 0.5;
	
if speed > 3
	speed = 3;

window_mouse_set_locked(window_has_focus());
if dead == false && window_mouse_get_locked()
	angle -= window_mouse_get_delta_x() / (5 * (UberCont.sensitivity / 100));