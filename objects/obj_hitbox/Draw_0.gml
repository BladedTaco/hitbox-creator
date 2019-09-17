/// @description draw hitbox

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

//draw hitbox hitboxes
var _pos = [];
_pos = draw_set_rotation(x, y, image_angle)
//draw center 1/3rd scale square
draw_set_alpha(0.2)
draw_set_colour(c_navy)
draw_rectangle(_pos[0] - image_xscale/6, _pos[1] - image_yscale/6, _pos[0] + image_xscale/6, _pos[1] + image_yscale/6, false)

//draw clickable area
if (shape != 1) {	
	draw_rectangle(_pos[0] - image_xscale/2, _pos[1] - image_yscale/2, _pos[0] + image_xscale/2, _pos[1] + image_yscale/2, false)
}

draw_reset_rotation()

//set draw options
draw_set_alpha(0.35)
draw_set_colour(hitbox_colour)

if (glow) { //if being selected in htibox table
	//glow more brightly
	draw_set_alpha(0.85)
	draw_set_colour($ffff50)
	glow = false;
	depth = -100
} else {
	depth = index - 50
}

//draw the hitbox with outline
scr_draw_shape(shape, x, y, image_xscale, image_yscale, image_angle, 3 + z)

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