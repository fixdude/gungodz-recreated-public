function gp_any(func, dvc)
{
	// this is awful - better watch out for new runtimes
	for (var i = gp_face1; i < gp_touchpadbutton; i++)
	{    
		if gamepad_button_check(dvc, i)
			return true;
	}
	return false;
}