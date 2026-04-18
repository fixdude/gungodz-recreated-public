global.__achievement = {};

#macro ACHIEVEMENT global.__achievement

enum ACH
{
	UNLOCKED,
	TITLE,
	DESC,
	HIDDEN,
	RM,
	FUNC,
	SPR
}

function scr_startAchievements()
{
	FORCEINLINE;
	
	with ACHIEVEMENT
	{
		var i = 0;
		// Out of order, but what can I do	
		A1 = [false, "GUN BABY", "find the shotgun", false, 0, function() {
			return Player.nextwep == Weapons.Shotgun;
		}, [sprAchievement, i++]];
		A2 = [false, "GUN TEEN", "find the minigun", false, 0, function() {
			return Player.nextwep == Weapons.Minigun;
		}, [sprAchievement, i++]];
		A3 = [false, "GUN ADULT", "find the bazooka", false, 0, function() {
			return Player.nextwep == Weapons.Bazooka;
		}, [sprAchievement, i++]];
		A4 = [false, "GUN GOD", "gun a god", false, lev5_1, function() {
			return Player.win;
		}, [sprAchievement, i++]];
		A5 = [false, "SHANK GOD", "shank a god", true, lev5_1, function() {
			return instance_exists(God) && God.my_health < (130 - 200);
		}, [sprAchievement, i++]];
		A6 = [false, "YUNG MONEY", "find half the triangles", false, menLevelSelect, function() {
			return instance_exists(LevelSelect) ? LevelSelect.stars >= 26 : 0;
		}, [sprAchievement, i++]];
		A7 = [false, "YUNG VENUZ", "find all the triangles", false, menLevelSelect, function() {
			return instance_exists(LevelSelect) ? LevelSelect.stars >= 52 : 0;
		}, [sprAchievement, i++]];
		A8 = [false, "NO SNITCHEZ", "kill first boss", false, lev2_3, function() {
			return !instance_exists(Boss1Trigger) && !instance_exists(Boss1);
		}, [sprAchievement, i++]];
		var s = variable_struct_get_names(self);
		MOD = []; // Modded achievements
		names = s;
		amount = array_length(names);
		
		for (var i = 0; i < amount; i++)
		{
			var achiev = self[$ names[i]];
			if use_steam && steam_on
				achiev[ACH.UNLOCKED] |= steam_get_achievement(achiev[ACH.TITLE]);
		}
	}
}

function scr_updateAchievements()
{
	FORCEINLINE;
	var n = ACHIEVEMENT.names, a = ACHIEVEMENT.amount;
	for (var i = 0; i < a; i++)
	{
		var name = n[i], achiev = ACHIEVEMENT[$ name];
		if achiev[ACH.UNLOCKED]
			continue;
			
		if (instance_exists(Player) && achiev[ACH.RM] == 0) || room == achiev[ACH.RM]
		{
			var r = achiev[ACH.FUNC]();
			achiev[ACH.UNLOCKED] |= r;
			if use_steam && steam_on && r == true && !steam_get_achievement(name)
				steam_set_achievement(name);
		}
	}
}

function scrAchievement(achievement)
{
	ds_queue_enqueue(UberCont.achievQueue, achievement);
}