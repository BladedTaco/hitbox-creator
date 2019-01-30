/// @description pause animation
if (instance_exists(obj_button_pause)) {
	with (obj_button_pause) {
		instance_change(obj_button_play, false)
	}
}