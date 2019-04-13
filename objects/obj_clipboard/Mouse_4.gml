/// @description show description

if (hitbox) { //if there is data to edit
	var _mx = mouse_x - x
	var _my = mouse_y - y

	if ((_mx > 0) and (_mx < width) and (_my > 0) and (_my < height)) {
		_mx = clamp(floor(_mx/32), 0, 26) //get x index
		_my = floor((_my + y_off)/23) - 1	//get y index
		if (_my = -1) { //show description
			show_message(desc[_mx])
		} else if (_my < array_height_2d(table)) { //change value or delete
			if (_my < hurtbox) {
				if (_mx < 25) { //change value
					//TODO ADD STUFF HERE
				} else if (_mx = 25) { //delete
					if (show_question("Are you sure you want to delete hitbox " + string(_my) + " from the clipboard?")) {
						hurtbox -= 1
						if (array_height_2d(table) = 2) { //if last hitbox, set to null array
							table = []
							table[1, 1] = -10
							table[1, 0] = -10
							table[0, 0] = -10
						} else { //remove a hitbox
							table = scr_array_remove_entry(table, _my, 0)
						}
					}
				} else { //move
					var _int = get_integer("Change position of hitbox " + string(_my), "")
					_int = clamp(_int, 0, hurtbox - 1)
					table = scr_array_swap_entry(table, 0, _my, _int)
				}
			} else if (_my > hurtbox) {
				if (_mx < 25) { //change value
					//TODO ADD STUFF
				} else if (_mx = 25) { //delete
					if (show_question("Are you sure you want to delete hurtbox " + string(_my - hurtbox - 1) + " from the clipboard?")) {
						if (array_height_2d(table) = 2) {
							table = []
							table[1, 1] = -10
							table[1, 0] = -10
							table[0, 0] = -10
						} else {
							table = scr_array_remove_entry(table, _my, 0)
						}
					}
				} else { //move
					var _int = get_integer("Change position of hitbox " + string(_my - hurtbox - 1), "")
					table = scr_array_swap_entry(table, 0, _my, _int + hurtbox + 1)
				}
			}
			max_y = max(0, (array_height_2d(table)-9)*23) //update max_y
			event_user(2)
		}
	}
}