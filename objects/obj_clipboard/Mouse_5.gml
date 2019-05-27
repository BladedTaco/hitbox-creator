/// @description remove hitbox group

var _my = floor((mouse_y - y - border - y_off)/32)

if (_my < array_length_1d(name)) { //name selected
	//remove it if confirmed
	if (show_question("Are you sure you want to remove this from the clipboard?")) {
		name = scr_array_remove_entry(name, _my)
		data = scr_array_remove_entry(data, _my)
		hitbox = scr_array_remove_entry(hitbox, _my)
	}
}

event_user(2)