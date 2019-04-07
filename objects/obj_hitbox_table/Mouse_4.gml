/// @description show description

if ((sprite > -1) and (frame > -1) and hitbox) { //if there is data to edit
	var _mx = window_mouse_get_x() - x
	var _my = window_mouse_get_y() - y
	var _table = table_list[frame] //get array

	if ((_mx > 0) and (_mx < width) and (_my > 0) and (_my < height)) {
		_mx = clamp(floor(_mx/32), 0, 26) //get x index
		_my = floor((_my + y_off[frame])/23) - 1	//get y index
		if (_my = -1) { //show description
			show_message(desc[_mx])
		} else if (_my < array_height_2d(_table)) { //change value or delete
			if (_my < hurtbox[frame]) {
				if (_mx < 25) { //change value
					_table[@ _my, _mx] = get_integer("Change value for hitbox " + string(_my) + " - " + string(title[_mx]), _table[_my, _mx])
				} else if (_mx = 25) { //delete
					if (show_question("Are you sure you want to delete hitbox " + string(_my) + "?")) {
						hurtbox[frame] -= 1
						if (array_height_2d(_table) = 2) { //if last hitbox, set to null array
							_table = []
							_table[1, 1] = -10
							_table[1, 0] = -10
							_table[0, 0] = -10
							table_list[frame] = _table	
						} else {
							table_list[frame] = scr_array_remove_entry(_table, _my, 0)
						}
					}
				} else { //move
					var _int = get_integer("Change priority of hitbox " + string(_my), _my)
					_int = clamp(_int, 0, hurtbox[frame] - 1)
					table_list[frame] = scr_array_swap_entry(_table, 0, _my, _int)
				}
			} else if (_my > hurtbox[frame]) {
				if (_mx < 25) { //change value
					_table[@ _my, _mx] = get_integer("Change value for hurtbox " + string(_my - hurtbox[frame] - 1) + " - " + string(title[_mx]), _table[_my, _mx])
				} else if (_mx = 25) { //delete
					if (show_question("Are you sure you want to delete hurtbox " + string(_my - hurtbox[frame] - 1) + "?")) {
						if (array_height_2d(_table) = 2) {
							_table = []
							_table[1, 1] = -10
							_table[1, 0] = -10
							_table[0, 0] = -10
							table_list[frame] = _table	
						} else {
							table_list[frame] = scr_array_remove_entry(_table, _my, 0)
						}
					}
				} else { //move
					var _int = get_integer("Change priority of hitbox " + string(_my - hurtbox[frame] - 1), _my - hurtbox[frame] - 1)
					table_list[frame] = scr_array_swap_entry(_table, 0, _my, _int + hurtbox[frame] + 1)
				}
			}
			max_y[frame] = max(0, (array_height_2d(table_list[frame])-9)*23) //update max_y
			event_user(2)
		}
	}
}