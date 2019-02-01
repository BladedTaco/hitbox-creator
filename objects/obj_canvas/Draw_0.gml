/// @description draw canvas
draw_self();
draw_set_colour(c_ltgray)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)

//set clipping mask shader
shader_set(shd_clip)
var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
shader_set_uniform_f(u_bounds, x + border, y + border, x + width, y + height);

draw_surface_part_ext(canvas, frame_x, frame_y, frame_width, frame_height, x + border - x_off*zoom, y + border - y_off*zoom, zoom, zoom, c_white, 1)


shader_reset() //reset the shader

draw_healthbar(x + 1, y + height + 8, x + width + 2, y + height + 12, (frame/(obj_data.sprite_array[sprite, NUM]-1))*100,
	c_black, c_aqua, c_aqua, 0, true, true)