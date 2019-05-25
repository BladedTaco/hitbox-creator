/// @description draw canvas
draw_self();
draw_set_colour(c_white)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)

	if !(surface_exists(surface)) {
		surface = surface_create(2048, 512)
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

	draw_surface(surface, x, y - y_off)	

	shader_reset() //reset the shader

draw_set_colour(c_black)