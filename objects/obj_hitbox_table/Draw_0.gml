/// @description draw canvas
draw_self();
draw_set_colour(c_white)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)
draw_text_colour(x + width/2 - 95, y + height/2, "Please select a sprite", c_aqua, c_lime, c_fuchsia, c_maroon, 1)

if ((sprite > -1) and (frame > -1)) {
	if !(surface_exists(surface)) {
		surface = surface_create(1024, 512)
		event_user(2)
	}
	
	if (frame != obj_canvas.frame) {
		frame = obj_canvas.frame
		event_user(2)
	}

	surface_set_target(surface)
	//ADD ANY SPECIAL PER FRAME DRAWS IN HERE
	//ADD ANY SPECIAL PER FRAME DRAWS IN HERE
	surface_reset_target()

	//set clipping mask shader
	shader_set(shd_clip)
	var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
	shader_set_uniform_f(u_bounds, x + border, y + border, x + width, y + height);

	draw_surface(surface, x, y - y_off[frame])	

	shader_reset() //reset the shader

}
