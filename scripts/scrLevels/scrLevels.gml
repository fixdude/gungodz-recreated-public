function levelInfo(name, parTime) constructor
{
	self.name = name;
	self.par_time = parTime;
}

function scrLevels()
{
	// Worlds/Levels are indexed from 1 instead of 0 in the original
	var noLevel = new levelInfo("AGH!", 00);
	
	fog = [000, 320, 320, 240, 480];
	l_info = [
		[noLevel],
		// WORLD 1
		[
			noLevel,
			new levelInfo("VENUS#SUPERMAX", 40),
			new levelInfo("DETENTION#CENTRE", 50),
			new levelInfo("GUARD#QUARTERS", 70),
			new levelInfo("???", 35)
		],
		
		// WORLD 2
		[
			noLevel,
			new levelInfo("SEWER#ENTRANCE", 00),
			new levelInfo("WASTEWATER", 00),
			new levelInfo("PUMPING#STATION", 00),
			new levelInfo("???", 00)
		],
		
		// WORLD 3
		[
			noLevel,
			new levelInfo("BASEMENT", 00),
			new levelInfo("FACILITY", 00),
			new levelInfo("WINE#HEAVEN", 00),
			new levelInfo("???", 00)
		],
		
		// WORLD 4
		[
			noLevel,
			new levelInfo("HALLWAY", 00),
			new levelInfo("LOBBY", 00),
			new levelInfo("ROOFTOP", 00),
			new levelInfo("???", 00)
		],
	];
}