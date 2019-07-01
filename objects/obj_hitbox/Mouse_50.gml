/// @description move hitbox
if (selected) {
	if (obj_canvas.active) { //if inside the canvas
		if (keyboard_check(vk_shift) or resizing) { //resize
			//check for initial shift press
			if !(resizing) {
				if !(rotating) {
					offset = [mouse_x, mouse_y]
				}
			}
			resizing = true;
			
			if (rotating) { //changing orientation
				var _d = -point_direction(x, y, mouse_x, mouse_y)
				image_angle = offset[0] - (offset[1] - _d)

				//update the table
				var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
				_table[@ index, 5] = (-image_angle + 3600) mod 360
			} else { //changing dimensions
				//change the size
				start_width += side[0]*2*(mouse_x - offset[0])/obj_canvas.zoom
				start_height += side[1]*2*(mouse_y - offset[1])/obj_canvas.zoom
			
				//make sure it has a width and height
				var _min = 0.15
				if (start_width <= _min) {
					start_width = _min	
				}
				if (start_height <= _min) {
					start_height = _min	
				}
				offset = [mouse_x, mouse_y]
			
				//update the table
				var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
				_table[@ index, 1] = start_width
				_table[@ index, 2] = start_height
			}
		} else { //move
			//update the position
			start_x = (mouse_x - offset[0])/obj_canvas.zoom
			start_y = (mouse_y - offset[1])/obj_canvas.zoom
	
			//update the table
			var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
			_table[@ index, 3] = start_x
			_table[@ index, 4] = start_y
		}
	}
}