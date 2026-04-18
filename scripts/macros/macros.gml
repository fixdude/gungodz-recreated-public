// It's named macros but it can also contain other stuff.
// actually it mostly doesn't even have actual macros

#macro is_desktop (os_type == os_windows || os_type == os_linux || os_type == os_macosx)
#macro use_native_cursor (os_type == os_windows && extension_exists("native_cursor"))
#macro use_steam extension_exists("Steamworks")
#macro FORCEINLINE gml_pragma("forceinline")

globalvar steam_on;

#region Compatibility

global.__objectDepths = ds_map_create();

function object_get_depth(obj)
{
	var d = global.__objectDepths[? obj];
	return d == undefined ? 0 : d;
}

function instance_create(x, y, obj)
{
	var myDepth = object_get_depth(obj);
	return instance_create_depth(x, y, myDepth, obj);
}

function draw_background_ext(sprite, x, y, xscale, yscale, rot, col, alpha)
{
	return draw_sprite_ext(sprite, 0, x, y, xscale, yscale, rot, col, alpha);
}

#macro draw_set_blend_mode gpu_set_blendmode

#endregion

#macro NUM_WORLDS 4
#macro NUM_LEVELS 4

enum Weapons
{
	None,
	Pistol,
	Shotgun,
	Minigun,
	Bazooka,
	Knife
}