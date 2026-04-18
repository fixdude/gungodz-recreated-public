global.__texUV = ds_map_create();
#macro texUV global.__texUV

var i = -1;
while sprite_exists(++i)
{
	var n = sprite_get_name(i);
	var ignore = ["msk", "spr_", "alf", sprStart, sprExit, "sprGold", "sprHUD", sprKnife, "sprLevel", "sprLogo", sprNew, sprPlayer, sprTile]
	
	var d = false;
	for (var j = 0; j < array_length(ignore); j++)
	{
		if string_starts_with(n, ignore[j])
		{
			d = true;
			break;
		}
	}
	if d == true
		continue;
		
	texUV[i] = sprite_get_uvs(i, 0);
}