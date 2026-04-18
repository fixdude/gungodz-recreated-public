if active
{
	if gp_any(gamepad_button_check_released, 0)
	|| keyboard_check_released(vk_anykey)
	|| mouse_check_button_released(mb_any)
	{
		instance_create(x, y, LevelSelect);
		active = false;
	}

	if is_desktop && InputReleased(INPUT_VERB.PAUSE)
		game_end();
}