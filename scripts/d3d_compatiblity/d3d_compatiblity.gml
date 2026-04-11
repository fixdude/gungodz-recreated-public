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

/// @description d3d - enable 3D
function d3d_start()
{
	var ret = global.__d3d;
	global.__d3d = true;
	
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	return ret;
}

/// @description d3d - disable 3d
/// @param enable true if enabled, false if disabled
function d3d_end()
{
	var ret = global.__d3d;
	global.__d3d = false;
	
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	return ret;
}

/// @description d3d - Defines a vertex for a textured primitive in 3D along with its corresponding normal.
/// @param x the x position
/// @param y the y position
/// @param z the z position
/// @param nx the normal x
/// @param ny the normal y
/// @param nz the normal z
/// @param u the normal u
/// @param v the normal v
function d3d_vertex_normal_texture(x, y, z, nx, ny, nz, u, v)
{
	vertex_position_3d(global.__d3dPrimBuffer, x, y, z);
	vertex_normal(global.__d3dPrimBuffer, nx, ny, nz);
	vertex_colour(global.__d3dPrimBuffer, draw_get_colour(), draw_get_alpha());
	vertex_texcoord(global.__d3dPrimBuffer,
	(u * global.__d3dPrimTexW) + global.__d3dPrimTexX,
	(v * global.__d3dPrimTexH) + global.__d3dPrimTexY);
}

/// @description  d3d - begin making a primitive stream
/// @param kind Primitive kind
/// @param tex Texture Index
function d3d_primitive_begin_texture(kind, tex)
{
	if global.__d3dPrimKind != -1
		show_debug_message("ERROR : cannot begin a primitive before end called on previous");

	global.__d3dPrimKind = kind;
	global.__d3dPrimTex = tex;
	
	var __uvs = texture_get_uvs(global.__d3dPrimTex);
	global.__d3dPrimTexX = __uvs[0];
	global.__d3dPrimTexY = __uvs[1];
	global.__d3dPrimTexW = __uvs[2] - __uvs[0];
	global.__d3dPrimTexH = __uvs[3] - __uvs[1];
	
	vertex_begin(global.__d3dPrimBuffer, global.__d3dPrimVF);	
}

/// @description d3d - end the primitive stream
function d3d_primitive_end()
{
	if global.__d3dPrimKind != -1
	{
		vertex_end(global.__d3dPrimBuffer);
		vertex_submit(global.__d3dPrimBuffer, global.__d3dPrimKind, global.__d3dPrimTex);
		
		// mark this as finished
		global.__d3dPrimKind = -1;
	}
	else
		show_debug_message( "d3d_primitive_end :: with no d3d_primitive_begin ");
}