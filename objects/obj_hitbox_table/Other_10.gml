/// @description populate table

if ((sprite > -1) and (frame > -1)) {
	//reset some variables
	table_list = []
	y_off = []
	max_y = []
	hurtbox = []

	var _table, _list, j;

	for (var _frame = 0; _frame < obj_data.sprite_array[sprite, NUM]; _frame++) {
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
				j = array_height_2d(_table)
				for (i = 0; i < 25; i++) {
					_table[j, i] = -10
				}
				hurtbox[_frame] = j
				j++
				_list = obj_data.hurtbox_list[obj_data.sprite_array[sprite, SURFACE]] //get hitbox list of character
			}
		}
		table_list[_frame] = _table //update frame table
		y_off[_frame] = 0 //update y offset
		max_y[_frame] = max(0, (array_height_2d(_table)-9)*23) //update max_y
	}

	event_user(2)
}

/*
new system
global.hitbox_list[hitbox and hurtbox arrays]
global.hitbox_bal
[3200 sprites + 10 hitboxes, 1280 frames + 25 entries]

//max_y