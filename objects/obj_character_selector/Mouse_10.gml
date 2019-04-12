/// @description set active
active = true
with (obj_button_character) {
	if (collision_point(mouse_x, mouse_y, id, false, false)) {
		image_blend = c_ltgray	
	}
}