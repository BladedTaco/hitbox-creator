/// @description receive hitbox selection
var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame] //get the hitbox tale
var _hitbox = 0;

with (obj_clipboard) { //with the clipboard
	var _num = array_length_1d(name) //get the row to insert into
	for (var i = array_length_1d(other.caller_data) - 1; i >= 0; i--) { //for each hitbox
		for (var o = 24; o >= 0; o--) { //for each data point
			//copy it across
			data[_num, i*25 + o] = _table[other.caller_data[i], o]
		}
		if (other.caller_data[i] < obj_hitbox_table.hurtbox[obj_hitbox_table.frame]) { //starting to read hitboxes
			_hitbox = max(i + 1, _hitbox) //set hitbox
		}
	}
	var _str = obj_data.sprite_array[obj_canvas.sprite, NAME] //get name
	_str = string_delete(_str, 1, 4) //remove spr_ prefix
	_str = string_replace_all(_str, "_", " ") //remove all _'s
	_str = _str + ": " + string(_hitbox) + " | " + string(array_length_1d(other.caller_data) - _hitbox)
	name[_num] = _str
	event_user(2)
}

