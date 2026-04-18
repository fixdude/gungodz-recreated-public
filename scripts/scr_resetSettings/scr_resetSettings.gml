function scr_resetSettings()
{
	InputPlayerSetMinThreshold(INPUT_THRESHOLD.BOTH, 0.25);
	InputBindingsReset(false);
	InputBindingsReset(true);
	db_clear(global.dbSettings);
	scr_saveOptions();
}
