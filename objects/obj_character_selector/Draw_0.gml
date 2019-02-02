/// @description draw canvas
draw_self();
draw_set_colour(c_white)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)

//set clipping mask shader
shader_set(shd_clip)
var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
shader_set_uniform_f(u_bounds, x + border, y + border, x + width, y + height);

with (obj_button_character) { //draw character buttons
	if (obj_list.character = character) {
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_aqua, 1)
	} else {
		draw_self();
	}
	if !(surface_exists(surface)) {
		event_user(0)	
	}
	draw_surface(surface, x, y)	
}

shader_reset() //reset the shader
