/// @description populate table

//reset some variables
table_list = []
y_off = []
max_y = []

var _table = array_create(1)
var _list = obj_data.hitbox_list[obj_data.sprite_array[sprite, SURFACE]] //get hitbox list of character

for (var _frame = 0; _frame < obj_data.sprite_array[sprite, NUM]; _frame++) {
	for (var i = 0; i < 10; i++) { //for each hitbox / hurtbox
		if (_list[(sprite - _list[0, 0])*10 + i, _frame*25 + o] = -10) { //if no hitbox
			break;	
		}
		for (var o = 0; o < 25; o++) { //for each data point
			_table[i, o] = _list[(sprite - _list[0, 0])*10 + i, _frame*25 + o] //transfer the data
		}
	}
	table_list[_frame] = _table //update frame table
	y_off[_frame] = 0 //update y offset
	max_y[_frame] = i*24 //update max_y
}

/*
new system
global.hitbox_list[hitbox and hurtbox arrays]
global.hitbox_bal
[3200 sprites + 10 hitboxes, 1280 frames + 25 entries]

//max_y