#macro d3d_set_fog gpu_set_fog
#macro d3d_set_hidden gpu_set_ztestenable

/// @description d3d - set projection 
/// @param xFrom	x of from position
/// @param yFrom	y of from position
/// @param zFrom	z of from position
/// @param xTo		x of to position
/// @param yTo		y of to position
/// @param zTo		z of to position
/// @param xUp		x of up vector
/// @param yUp		y of up vector
/// @param zUp		z of up vector
/// @param fov		field of view angle
/// @param aspect	aspect ration
/// @param zmin		z buffer min
/// @param zmax		z buffer max
function d3d_set_projection_ext(xFrom, yFrom, zFrom, xTo, yTo, zTo, xUp, yUp, zUp, fov, aspect, zmin, zmax)
{
	var mV = matrix_build_lookat(
		xFrom, yFrom, zFrom,
		xTo, yTo, zTo,
		xUp, yUp, zUp
	);
	var mP = matrix_build_projection_perspective_fov(-fov, -aspect, zmin, zmax);
	
	var c = camera_get_active();
	camera_set_view_mat(c, mV);
	camera_set_proj_mat(c, mP);
	camera_apply(c);
}

/// @description d3d - set orthographic 
/// @param x		x of tl corner
/// @param y		y of tl corner
/// @param w		w of view
/// @param h		h of view
/// @param angle	rotation angle of the projection
function d3d_set_projection_ortho(x, y, w, h, angle)
{
	var xx = x;
	var yy = y;
	var ww = w;
	var hh = h;
	var mV = matrix_build_lookat(x + (w / 2), y + (h / 2), -16000, x + (w / 2), y + (h / 2), 0, dsin(-angle), dcos(-angle), 0);
	var mP = matrix_build_projection_ortho(w, h, 1, 32000);

	var c = camera_get_active();
	camera_set_view_mat(c, mV);
	camera_set_proj_mat(c, mP);
	camera_apply(c);
}

global.d3d = false;
/// @description d3d - enable 3D
function d3d_start()
{
	global.d3d = true;
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	gpu_set_alphatestenable(true);
	return true;
}

/// @description d3d - disable 3d
function d3d_end()
{
	global.d3d = false;
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	gpu_set_alphatestenable(false);
	return true;
}
