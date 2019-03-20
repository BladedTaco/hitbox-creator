/// @description populate table

var _table = array_create(1)


var _list = obj_data.hitbox_list[obj_data.sprite_array[sprite, SURFACE]] //get hitbox list of character

for (var _frame = 0; _frame < obj_data.sprite_array[sprite, NUM]; _frame++) {
	for (var i = 0; i < 10; i++) { //for each hitbox
		for (var o = 0; o < 25; o++) { //for each data point
			_table[i, o] = _list[(sprite - _list[0, 0])*10 + i, _frame*25 + o] //transfer the data
		}
	}
	table_list[_frame] = _table
}

/*
new system
global.hitbox_list[hitbox and hurtbox arrays]
global.hitbox_bal
[3200 sprites + 10 hitboxes, 1280 frames + 25 entries]

//max_y