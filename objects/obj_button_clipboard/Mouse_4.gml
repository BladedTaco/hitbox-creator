/// @description handle button press
event_inherited();
if ((obj_hitbox_table.sprite > -1) and (obj_hitbox_table.frame > -1)) { //if there is a sprite selected
	with(obj_hitbox_table) {
		caller = other.id
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