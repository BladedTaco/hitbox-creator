/// @description draw htibox


var z = obj_canvas.zoom
if (z != zoom) {
	zoom = 1
	x_off = 0
	y_off = 0
	if (z = zoom) and false {
		
	}
}

x = start_x + obj_canvas.sprite_origin_pos[0] + x_off
y = start_y + obj_canvas.sprite_origin_pos[1] + y_off
image_xscale = start_width*z
image_yscale = start_height*z


//set clipping mask shader
shader_set(shd_clip)
var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
shader_set_uniform_f(u_bounds, bounds[0], bounds[1], bounds[2], bounds[3]);

draw_set_alpha(0.3)
draw_set_colour(c_aqua)
draw_rectangle(x - image_xscale/2, y - image_yscale/2, x + image_xscale/2, y + image_yscale/2, false)
draw_set_alpha(1)

shader_reset();