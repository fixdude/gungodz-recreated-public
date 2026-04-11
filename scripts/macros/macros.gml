// It's named macros but it can also contain other stuff.

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