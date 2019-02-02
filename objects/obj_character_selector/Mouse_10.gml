/// @description set active
active = true
with (obj_button_character) {
	if (collision_point(window_mouse_get_x(), window_mouse_get_y(), id, false, false)) {
		image_blend = c_ltgray	
	}
}