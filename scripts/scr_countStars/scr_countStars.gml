function scr_countStars()
{
	if !instance_exists(UberCont)
		return 0;
	
	var _stars = 0;
	var wld = 1;
	
	repeat NUM_WORLDS
	{
		var lev = 1;
		
		repeat NUM_LEVELS
		{
			_stars += UberCont.stars[wld, lev];
			lev++;
		}
		
		wld++;
	}
	
	return _stars;
}
