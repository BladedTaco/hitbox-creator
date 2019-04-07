/// @description 
event_inherited();
with (obj_hitbox_table) {
	if ((sprite > -1) and (frame > -1)) { //if there is a sprite selected
		var _int = get_integer("which row would you like to insert the hitbox", 0)
		if (_int <= hurtbox[frame]) {
			hurtbox[frame]++	
		}
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