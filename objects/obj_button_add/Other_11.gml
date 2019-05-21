/// @description callback - hitbox selection
with (obj_hitbox_table) {
	show_debug_message(other.caller_data)
	if ((sprite > -1) and (frame > -1)) { //if there is a sprite selected

		var _int = other.caller_data[0]
		if (hitbox) { //if there is already some data
			scr_array_add_entry(table_list[frame], _int,
			0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
		} else { //no data
			var _table = table_list[frame]
			for (var i = 0; i < 25; i++) {
				_table[@ (_int > 0), i] = 0
			}
		}
	
		max_y[frame] = max(0, (array_height_2d(table_list[frame])-9)*23) //update max_y
	
		event_user(2)
	}
}