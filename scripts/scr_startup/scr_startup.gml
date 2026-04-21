global.dbSettings = db_create();

function scr_startup()
{
	global.dbSettings = db_debug_load("config.json") ?? db_create();
	InputPlayerSetMinThreshold(INPUT_THRESHOLD.BOTH, db_read(global.dbSettings, 0.25, "deadzone"));
	
	try
		InputBindingsImport(false, db_read(global.dbSettings, undefined, "kbm bindings"));
	catch (_error)
		InputBindingsReset(false);
	
	try
		InputBindingsImport(true, db_read(global.dbSettings, undefined, "gamepad bindings"));
	catch (_error)
		InputBindingsReset(true);
	
	Screen.size = db_read(global.dbSettings, 200, "screen mult");
	Screen.setRatio(db_read(global.dbSettings, 16/10, "screen ratio"));
	Screen.setDisplay(db_read(global.dbSettings, 0, "antialiasing"), db_read(global.dbSettings, false, "vsync"));
	Screen.sync().apply();
}
