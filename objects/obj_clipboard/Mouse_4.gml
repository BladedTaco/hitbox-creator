/// @description add hitbox group
var _my = floor((mouse_y - y - border - y_off)/32)
var _num = 0; //the position to insert into the table
var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
var _hurtbox = obj_hitbox_table.hurtbox[obj_hitbox_table.frame]
var i = array_length_2d(data, _my)/25 - 1
var _len = array_height_2d(_table)
var _add = [];

if (!obj_hitbox_table.hitbox) { //no data
	//remove the extra row and reset the table reference
	 obj_hitbox_table.table_list[obj_hitbox_table.frame] = scr_array_remove_entry(_table, 1, 0) 
	_table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
	_len = 1
}
	
if ((_hurtbox + hitbox[_my] <= 10) and ((i - hitbox[_my]) + (_len - _hurtbox) <= 10)) { //data fits
	
	for (i = i; i >= 0; i--) { //for each hitbox
		if (i < hitbox[_my]) { //adding a hitbox
			obj_hitbox_table.hurtbox[obj_hitbox_table.frame] += 1 //increase the frames hurtbox value
			_num = _hurtbox //set array position to add into
		} else { //adding a hurtbox
			_num = _len //set array position to add into
		}
		for (var o = 24; o >= 0; o--) { //for each data point
			//add it to the add array
			_add[o] = data[_my, i*25 + o]
		}
		scr_array_add_entry(_table, _num, 0, _add) //add the data
	}
	//update the table
	with (obj_hitbox_table) {
		event_user(2)	
	}
} else {
	show_message("Please clear more space in the hitbox table")	
}