/// @description handle button press
event_inherited();
with(obj_hitbox_table) {
	if ((sprite > -1) and (frame > -1)) { //if there is a sprite selected
		obj_button_export_clipboard.image_blend = c_red
		caller = other.id
		caller_string = "Please select the hitbox(es) to copy"
		caller_type = GIVEN_NUMBER
		caller_sub_type = -1
		event_user(3)	
	}
}


/*

//copy over a hitbox
		var _num = get_integer("Choose which hitbox to copy,\n-1 to cancel", -1)
		if (_num >= 0) {
			var _name = get_string("Name this hitbox for identification in clipboard.", "");
			while (_name = "") { //make sure it is named.
				_name = get_string("Please enter a valid name. It's for your own good.", "")
			}
			//send over hitbox to clipboard
		}