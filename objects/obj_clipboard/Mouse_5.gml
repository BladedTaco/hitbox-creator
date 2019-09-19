/// @description remove hitbox group

var _my = floor((mouse_y - y - border - y_off)/separation)

if (_my < array_length_1d(name)) { //name selected
	//remove it if confirmed
	if (show_question("Are you sure you want to remove this from the clipboard?")) {
		obj_button_export_clipboard.image_blend = c_red
		name = scr_array_remove_entry(name, _my)
		data = scr_array_remove_entry(data, _my)
		hitbox = scr_array_remove_entry(hitbox, _my)
		sprite = scr_array_remove_entry(sprite, _my)
	}
}

event_user(2)