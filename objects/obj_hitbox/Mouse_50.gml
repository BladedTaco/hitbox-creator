/// @description move hitbox
if (selected) {
	if (obj_canvas.active) { //if inside the canvas
		start_x = (mouse_x - offset[0])/obj_canvas.zoom
		start_y = (mouse_y - offset[1])/obj_canvas.zoom
	
		var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
		_table[@ index, 3] = start_x
		_table[@ index, 4] = start_y
	}
}