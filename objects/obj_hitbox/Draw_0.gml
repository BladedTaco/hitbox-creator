/// @description draw htibox


var z = obj_canvas.zoom

x = start_x*z + obj_canvas.sprite_origin_pos[0]
y = start_y*z + obj_canvas.sprite_origin_pos[1]
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