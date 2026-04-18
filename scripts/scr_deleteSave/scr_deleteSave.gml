function scr_deleteSave()
{
	if file_exists("gg.sav")
	{
		var _i = 9;
		repeat 9
		{
			if file_exists($"gg_backup_{_i}.sav")
				file_rename($"gg_backup_{_i}.sav", $"gg_backup_{_i + 1}.sav");
			_i--;
		}
		
		file_rename("gg.sav", "gg_backup_1.sav");
	}
}
