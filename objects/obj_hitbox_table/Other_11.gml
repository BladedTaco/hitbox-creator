/// @description save table

if ((sprite > -1) and (frame > -1) and data) {
	//get some arrays
	var _table, _list;

	//save data to main array
	for (var _frame = 0; _frame < obj_data.sprite_array[sprite, NUM]; _frame++) {
		_table = table_list[_frame]
		if (_table[0, 0] + _table[1, 0] != -20) { //if there is data
			_list = obj_data.hitbox_list[obj_data.sprite_array[sprite, SURFACE]] //get hitbox list of character
			for (var i = 0; i < hurtbox[_frame]; i++) { //for each hitbox
				for (var o = 0; o < 25; o++) { //for each data point
					_list[@ (sprite - _list[0, 0])*10 + i, _frame*25 + o] = _table[i, o]//transfer the data
				}
			}
			_list = obj_data.hurtbox_list[obj_data.sprite_array[sprite, SURFACE]] //get hitbox list of character
			for (i = hurtbox[_frame] + 1; i < array_height_2d(_table); i++) { //for each hurtbox
				for (var o = 0; o < 25; o++) { //for each data point
					_list[@ (sprite - _list[0, 0])*10 + i - hurtbox[_frame] - 1, _frame*25 + o] = _table[i, o]//transfer the data
				}
			}
		}
	}
}

//TODO add a save button, add saving to file