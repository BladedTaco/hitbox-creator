/// @description move hitbox
if (selected) {
	if (obj_canvas.active) { //if inside the canvas
		if (keyboard_check(vk_shift) or resizing) { //resize
			//check for initial shift press
			if (rotating) { //changing orientation
				var _d = -point_direction(x, y, mouse_x, mouse_y)
				image_angle = offset[0] - (offset[1] - _d)

				//update the table
				var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
				_table[@ index, 5] = (-image_angle + 3600) mod 360
			} else { //changing dimensions
				
				var _m = [];
				var _x = [];
				_m = scr_get_rotated_position(mouse_x, mouse_y, image_angle)
				_x = scr_get_rotated_position(x, y, image_angle)
				
				if !(resizing) {
					offset = [_m[0], _m[1]]
				}
				
				//change the size
				//check width
				var _min = 0.15
				var _diff = []
				_diff = [side[0]*(_m[0] - offset[0])/obj_canvas.zoom, side[1]*(_m[1] - offset[1])/obj_canvas.zoom]
				
				if (start_width + _diff[0] < _min) { //squished too much
					_diff[0] = _min - start_width 
				}
				start_width += _diff[0]
				
				//check height
				if (start_height + _diff[1] < _min) { //squished too much
					_diff[1] = _min - start_height
				}
				start_height += _diff[1]
				
				_diff = scr_get_rotated_position(side[0]*_diff[0], side[1]*_diff[1], -image_angle)
				start_x += _diff[0]/2
				
				start_y += _diff[1]/2
				
				//update offset
				offset = [_m[0], _m[1]]
			
				//update the table
				var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
				_table[@ index, 1] = start_width
				_table[@ index, 2] = start_height
				_table[@ index, 3] = start_x
				_table[@ index, 4] = start_y
			}
			resizing = true;
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