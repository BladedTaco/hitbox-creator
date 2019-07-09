/// @description populate table
//*

with (obj_hitbox_table) {
	if ((sprite > -1) and (frame > -1)) {
		//reset some variables

		var _temp_list, _table, _list, j;
	
		_list = obj_data.hitbox_list[obj_data.sprite_array[sprite, SURFACE]]
		if (sprite = _list[0, 0]) { //base sprite, no changes allowed
			return false; //return no changes made
		}
	
		//get the hitbox table equivalent from the data object
		for (var _frame = 0; _frame < obj_data.sprite_array[sprite, NUM]; _frame++) { //for each frame
			_table = array_create(1, -10) //create an array reference
			_list = obj_data.hitbox_list[obj_data.sprite_array[sprite, SURFACE]] //get hitbox list of character
			j = 0
			repeat(2) {
				for (var i = 0; i < 10; i++) { //for each hitbox / hurtbox
					if (_list[(sprite - _list[0, 0])*10 + i, _frame*25] = -10) { //if no hitbox
						break;	
					}
					for (var o = 0; o < 25; o++) { //for each data point
						_table[i + j, o] = _list[(sprite - _list[0, 0])*10 + i, _frame*25 + o] //transfer the data
					}
				}
				if (j = 0) {
					if (_table[0, 0] != -10) {
						j = array_height_2d(_table) //hitboxes
					} else {
						j = 0 //no hitboxes	
						_table[1, 1] = -10
						_table[1, 0] = -10
					}
					for (i = 0; i < 25; i++) {
						_table[j, i] = -10
					}
					//hurtbox[_frame] = j
					j++
					_list = obj_data.hurtbox_list[obj_data.sprite_array[sprite, SURFACE]] //get hitbox list of character
				}
			}
			_temp_list[_frame] = _table //update frame table
		}
		
		//iterate through the arrays and check if they are equal
		var i, o, a, b;
		for (_frame = obj_data.sprite_array[sprite, NUM] - 1; _frame >= 0; _frame--) { //for each frame
			//get the arrays to check
			a = _temp_list[_frame]
			b = table_list[_frame]
			////check if they have the same height
			//if (array_height_2d(a) != array_height_2d(b)) {
				
			//}
			////loop through the first dimension
			//for (i = array_height_2d(a) - 1; i >= 0; i--) {
			//	for (o = array_length_2d(
			//}
			if (!array_equals(a, b)) { //if the arrays are different
				return true; //return the table has changed
			}
		}
	}
	return false; //return no change
	/*
	new system
	global.hitbox_list[hitbox and hurtbox arrays]
	global.hitbox_bal
	[3200 sprites + 10 hitboxes, 1280 frames + 25 entries]

	//max_y

	//*/
}