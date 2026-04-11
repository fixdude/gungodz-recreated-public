function levelInfo(name, parTime) constructor
{
	nam = name;
	par = parTime;
}

function scrLevels()
{
	fog[1] = 320;
	fog[2] = 320;
	fog[3] = 240;
	fog[4] = 480;
	l_info = [
		// WORLD 1
		[
			new levelInfo("VENUS#SUPERMAX", 40),
			new levelInfo("DETENTION#CENTRE", 50),
			new levelInfo("GUARD#QUARTERS", 70),
			new levelInfo("???", 35)
		],
		
		// WORLD 2
		[
			new levelInfo("SEWER#ENTRANCE", 40),
			new levelInfo("WASTEWATER", 40),
			new levelInfo("PUMPING#STATION", 60),
			new levelInfo("???", 25)
		],
		
		// WORLD 3
		[
			new levelInfo("VENUS#SUPERMAX", 40),
			new levelInfo("DETENTION#CENTRE", 40),
			new levelInfo("GUARD#QUARTERS", 60),
			new levelInfo("???", 25)
		],
		
		// WORLD 4
		[
			new levelInfo("VENUS#SUPERMAX", 40),
			new levelInfo("DETENTION#CENTRE", 40),
			new levelInfo("GUARD#QUARTERS", 60),
			new levelInfo("???", 25)
		],
		
	];
	l_nam[2, 1] = "SEWER#ENTRANCE";
	l_nam[2, 2] = "WASTEWATER";
	l_nam[2, 3] = "PUMPING#STATION";
	l_nam[2, 4] = "???";
	l_nam[3, 1] = "BASEMENT";
	l_nam[3, 2] = "FACILITY";
	l_nam[3, 3] = "WINE#HEAVEN";
	l_nam[3, 4] = "???";
	l_nam[4, 1] = "HALLWAY";
	l_nam[4, 2] = "LOBBY";
	l_nam[4, 3] = "ROOFTOP";
	l_nam[4, 4] = "???";
	l_par[1, 1] = 40;
	l_par[1, 2] = 40;
	l_par[1, 3] = 60;
	l_par[1, 4] = 25;
	l_par[2, 1] = 40;
	l_par[2, 2] = 60;
	l_par[2, 3] = 30;
	l_par[2, 4] = 60;
	l_par[3, 1] = 35;
	l_par[3, 2] = 75;
	l_par[3, 3] = 95;
	l_par[3, 4] = 40;
	l_par[4, 1] = 70;
	l_par[4, 2] = 75;
	l_par[4, 3] = 30;
	l_par[4, 4] = 25;
}