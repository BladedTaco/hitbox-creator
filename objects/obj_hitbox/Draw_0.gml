/// @description draw hitbox

if (image_angle > 0) {
	image_angle += 3
	if (image_angle > 360) {
		image_angle = 1	
	}
}

var z = obj_canvas.zoom

x = start_x*z + obj_canvas.sprite_origin_pos[0]
y = start_y*z + obj_canvas.sprite_origin_pos[1]
image_xscale = start_width*z
image_yscale = start_height*z

//set clipping mask shader
shader_set(shd_clip_rotation_no_tex)
var u_bounds = shader_get_uniform(shd_clip_rotation_no_tex, "u_bounds")
var dir = shader_get_uniform(shd_clip_rotation_no_tex, "_dir")
shader_set_uniform_f_array(u_bounds, bounds);
shader_set_uniform_f(dir, degtorad(image_angle))


draw_set_alpha(0.35)
draw_set_colour(hitbox_colour)

if (glow) { //if being selected in htibox table
	//glow more brightly
	draw_set_alpha(0.85)
	draw_set_colour($ffff50)
	glow = false;
	depth = -1
} else {
	depth = index
}
scr_draw_shape(shape, x, y, image_xscale, image_yscale, image_angle, 3 + z)

/*
var _pos = [];
_pos = draw_set_rotation(x, y, image_angle)
	
if (shape != 1) {	
	draw_set_alpha(0.15)
	draw_set_colour(c_navy)
	draw_rectangle(_pos[0] - image_xscale/2, _pos[1] - image_yscale/2, _pos[0] + image_xscale/2, _pos[1] + image_yscale/2, false)
}

draw_set_alpha(0.35)
draw_set_colour(hitbox_colour)

if (glow) { //if being selected in htibox table
	//glow more brightly
	draw_set_alpha(0.85)
	draw_set_colour($ffff50)
	glow = false;
	depth = -1
} else {
	depth = index
}

var _col = (c_white - hitbox_colour) //get inverse of colour for outline drawing to make sure shape is always visible

switch (shape) {
	case 1: //Rectangle
		draw_rectangle(_pos[0] - image_xscale/2, _pos[1] - image_yscale/2, _pos[0] + image_xscale/2, _pos[1] + image_yscale/2, false)
		draw_set_colour(_col)
		scr_draw_polygon_outline(_pos[0], _pos[1], image_xscale/sqrt(2), image_yscale/sqrt(2), 3 + z, 360, 1, 4, 45)
	break;
	
	case 2: //Ellipse
		draw_ellipse(_pos[0] - image_xscale/2, _pos[1] - image_yscale/2, _pos[0] + image_xscale/2, _pos[1] + image_yscale/2, false)
		draw_set_colour(_col)
		scr_draw_ellipse_outline(_pos[0], _pos[1], image_xscale/2, image_yscale/2, 3 + z, 360, 1)
	break;
	
	case 3: //Triangle
		draw_triangle(
			_pos[0] - image_xscale/2, _pos[1] + image_yscale/2,
			_pos[0] + image_xscale/2, _pos[1] + image_yscale/2,
			_pos[0], _pos[1] - image_yscale/2,
			false
		)
		draw_set_colour(_col)
		scr_draw_triangle_outline(_pos[0], _pos[1], image_xscale, image_yscale, 3 + z, 360, 1, 3, 0)
	break;
	
	default: //no shape defined
		draw_line_width(_pos[0] - 15, _pos[1] - 15, _pos[0] + 15, _pos[1] + 15, 5)
		draw_line_width(_pos[0] + 15, _pos[1] - 15, _pos[0] - 15, _pos[1] + 15, 5)
	break;
}


//reset shader and rotation
draw_reset_rotation()

*/

shader_reset();


if (selected) {
	//draw the updated position
	var _x = x + image_xscale / 2 + 5
	var _y = y - image_yscale / 2 + 5
	var _str = string(start_x) + ", " + string(start_y)
	draw_set_alpha(0.4)
	draw_set_colour(c_black)
	draw_rectangle(_x, _y - string_height(_str) - 4, _x + string_width(_str) + 4, _y, false)
	draw_set_alpha(1)
	draw_set_colour(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	draw_text(_x + 2, _y - 2, _str)
}

draw_set_alpha(0.85)
draw_set_colour(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
//draw_text(x, y, index)

draw_set_alpha(1)