if !instance_exists(AchievPopup) && !ds_queue_empty(achievQueue)
{
	with instance_create(0, 0, AchievPopup)
	{
		achiev = ds_queue_dequeue(other.achievQueue);
		event_user(0);
	}
}

scr_updateAchievements();

if use_native_cursor
	native_cursor_update();

if use_native_cursor && !global.d3d
{
	var w = window_has_focus();
	if focus != w
	{
		focus = w;
		if w
		{
			native_cursor_set(cur);
			cursor = true;
		}
		else
		{
			native_cursor_reset();
			cursor = false;
		}
	}
}
else if use_native_cursor
{
	native_cursor_reset();
	cursor = false;	
}