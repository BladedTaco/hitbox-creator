/// @description move hitbox
if (selected) {
	start_x = mouse_x - offset[0]
	start_y = mouse_y - offset[1]
	
	var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
	_table[@ index, 3] = start_x + start_width/2
	_table[@ index, 4] = start_y + start_height/2
	with (obj_hitbox_table) {
		event_perform(ev_other, ev_user2)
	}
}