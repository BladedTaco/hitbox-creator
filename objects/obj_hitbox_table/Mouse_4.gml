/// @description show description

if ((sprite > -1) and (frame > -1)) { //if there is data to edit
	if (hitbox) {
		var _mx = mouse_x - x
		var _my = mouse_y - y
		var _table = table_list[frame] //get array

		if ((_mx > 0) and (_mx < width) and (_my > 0) and (_my < height)) { //if within bounds of hitboxes
			_mx = clamp(floor(_mx/32), 0, 26) //get x index
			_my = floor((_my + y_off[frame])/23) - 1	//get y index
		
			if (selection_mode) { //select a hitbox
				if ((_my >= 0) and (_my != hurtbox[frame]) and (_my < array_height_2d(_table))) { //selected a hitbox
					//check for between
					if (caller_type = BETWEEN) {
						_my = ceil(floor((mouse_y - y + 12 + y_off[frame])/23) - 1)	//get y index	
					}
				
					//shift and control
					if (keyboard_check(vk_shift) and caller_multiselect) { //select many
						if (caller_shift = -1) { //start multi-select
							caller_shift = _my
						} else { //end multi select
							for (var o = min(caller_shift, _my); o <= max(caller_shift, _my); o++) {
								if (o = hurtbox[frame]) { continue }
								for (var i = array_length_1d(caller_data); i > 0; i--) {
									if (caller_data[i-1] = o) {
										caller_data = scr_array_remove_entry(caller_data, i-1)
										break;
									}
								}
								if (i = 0) {
									caller_data[array_length_1d(caller_data)] = o
								}
							}
							caller_shift = -1
						}
					} else if (keyboard_check(vk_control) and caller_multiselect) { //select one on or off
						for (var i = array_length_1d(caller_data); i > 0; i--) {
							if (caller_data[i-1] = _my) {
								caller_data = scr_array_remove_entry(caller_data, i-1)
								exit;
							}
						}
						caller_data[array_length_1d(caller_data)] = _my
					} else { //end the selection and return the data
						for (var i = array_length_1d(caller_data); i > 0; i--) { //make sure selected is not a dupe
							if (caller_data[i-1] = _my) {
								event_user(3) //end selection without adding
								exit;
							}
						}
						//add selection then end selection
						caller_data[array_length_1d(caller_data)] = _my
						event_user(3)
					}
				} else if ((_my >= -1) and (_my <= array_height_2d(_table)) and (caller_type = BETWEEN)) {
					_my = floor((mouse_y - y + 12 + y_off[frame])/23) - 1	//get y index	
					//add selection then end selection
					caller_data[array_length_1d(caller_data)] = ceil(_my)
					event_user(3)
				}
			} else { //change data or show description
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
							var _int = get_integer("Change priority of hitbox " + string(_my), "")
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
							var _int = get_integer("Change priority of hitbox " + string(_my - hurtbox[frame] - 1), "")
							table_list[frame] = scr_array_swap_entry(_table, 0, _my, _int + hurtbox[frame] + 1)
						}
					}
					max_y[frame] = max(0, (array_height_2d(table_list[frame])-9)*23) //update max_y
					event_user(2)
				}
			}
		}
	} else if (selection_mode) { //add hitbox or hurtbox
		if (active) {
			var _my = floor((mouse_y - y)/23) - 1.5
			if (abs(_my) = 0.5) {
				//add selection then end selection
				caller_data = [_my]
				event_user(3)
			}
		}
	}
}