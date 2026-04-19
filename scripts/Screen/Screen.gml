function Screen()
{
	static width = 320;
	static height = 200;
	static aspect_ratio = 1.6;
	static size = 200;
	
	static reset = function()
	{
		var ratio = Screen.aspect_ratio;
		Screen.width = ratio * Screen.size;
		Screen.height = Screen.size;
	}
	
	static setScreenSize = function(w, h)
	{
		Screen.aspect_ratio = max(w, h) / min(w, h);
	}
	
	static setRatio = function(ratio)
	{
		if is_array(ratio)
			ratio = ratio[0] * (1 / ratio[1]);
	}
	
	static getRatio = function()
	{
		var s = Screen.aspect_ratio;
		while s != round(s)
			s *= 10;
		
		return [s, s / Screen.aspect_ratio];
	}
}

Screen();