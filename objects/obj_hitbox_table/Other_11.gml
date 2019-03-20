/// @description save table

//get some arrays
var _table = table_list[frame]
var _list = obj_data.hitbox_list[obj_data.sprite_array[sprite, SURFACE]] //get hitbox list of character

//save data to main array
for (var _frame = 0; _frame < obj_data.sprite_array[sprite, NUM]; _frame++) {
	for (var i = 0; i < array_height_2d(_table); i++) { //for each hitbox / hurtbox
		for (var o = 0; o < 25; o++) { //for each data point
			 _list[@ (sprite - _list[0, 0])*10 + i, _frame*25 + o] = _table[i, o]//transfer the data
		}
	}
}


//TODO add a save button, add saving to file