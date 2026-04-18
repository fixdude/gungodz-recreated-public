function scr_saveOptions()
{
	db_write(global.dbSettings, InputPlayerGetMinThreshold(INPUT_THRESHOLD.BOTH), "deadzone");
	db_write(global.dbSettings, InputBindingsExport(false), "kbm bindings");
	db_write(global.dbSettings, InputBindingsExport(true), "gamepad bindings");
	db_write(global.dbSettings, Screen.size, "screen mult");
	db_write(global.dbSettings, Screen.aspect_ratio, "screen ratio");
	db_set_metadata(global.dbSettings, 
	{
		game_version: "2.0.4.0"
	});
	db_debug_save(global.dbSettings, "config.json", true);
	switch_save_data_commit();
}
