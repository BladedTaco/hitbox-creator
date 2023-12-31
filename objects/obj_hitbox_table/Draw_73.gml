/// @description draws for selection mode
if (selection_mode) {
	//grey out surrounding
	draw_set_alpha(0.75)
	draw_set_colour(c_dkgray)
	draw_rectangle(-10, -10, room_width + 10, obj_canvas.y - 1, false) //top
	draw_rectangle(-10, y + height + border, room_width + 10, room_height + 10, false) //bottom	
	draw_rectangle(-10, obj_canvas.y, x - 1, y + height - 1 + border, false) //left
	draw_rectangle(x + width + border, obj_canvas.y, room_width + 10, y + height - 1 + border, false) //right
	draw_rectangle(x, obj_canvas.y + obj_canvas.height + obj_canvas.border, x + width - 1 + border, y - 1, false) //middle
	
	
	
	var _my
	
	//draw between hover if needed
	if ((active) and (caller_type = BETWEEN)) {
		if (hitbox) { //already some data
			draw_set_colour(c_aqua)
			draw_set_alpha(0.4)
			_my = floor((mouse_y - y + 12 + y_off[frame])/23) - 1
			if ((_my <= array_height_2d(table_list[frame])) and (_my >= 0)) { //acceptable range
				_my += 1 - y_off[frame]/23
				draw_line_width(x, max(y + _my*23 - 2, y), x + width, min(y + _my*23 - 2, y + height), 6)
				_my -= 1 - y_off[frame]/23
			}
		} else { //no data yet
			draw_set_colour(c_dkgray)
			draw_set_alpha(1)
			draw_set_halign(fa_center)
			draw_set_valign(fa_top)
			draw_text(x + width/2, y + 23 + border, "Add hitbox")
			draw_text(x + width/2, y + 46 + border, "Add hurtbox")
			draw_set_colour(c_aqua)
			draw_set_alpha(0.4)
			_my = floor((mouse_y - y + y_off[frame])/23) - 1
			if ((_my < array_height_2d(table_list[frame])) and (_my >= 0)) { //acceptable range
				_my += 1 - y_off[frame]/23
				draw_rectangle(
					x,
					max(y + _my*23, y),
					x + width,
					min(y + (_my+1)*23, y + height),
					false
				)
				_my -= 1 - y_off[frame]/23
			}
		}
	}
	
	draw_set_colour(c_blue)
	draw_set_alpha(0.4)
	//draw over selected
	for (var i = 0; i < array_length_1d(caller_data); i++) {
		_my = (caller_data[i] + 1)*23 - y_off[frame]
		draw_rectangle(
			x,
			clamp(y + _my, y, y + height),
			x + width,
			clamp(y + _my + 22, y, y + height),
			false
		)
	}
	
	if (caller_shift > -1) {
		draw_set_colour(c_lime)
		draw_set_alpha(0.25)
		_my = (caller_shift + 1)*23 - y_off[frame]
		draw_rectangle(
			x,
			clamp(y + _my, y, y + height),
			x + width,
			clamp(y + _my + 22, y, y + height),
			false
		)	
	}
	
	var control_string = @"	Left Click -- select hitbox, end selection
							Shift + Left Click -- Toggle range of hitboxes
							Ctrl + Left Click -- Toggle a hitboxes selection
							Right Click -- To cancel selection"
	
	if (!caller_multiselect) {
			var control_string = @"	Left Click -- select hitbox and end selection
									Right Click -- To cancel selection"
	}
	
	draw_set_alpha(1)
	draw_set_colour(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text(225, 200, caller_string)
	draw_text(225, 300, control_string)
}

if (update > 0) {
	update /= 1.3;
	draw_set_alpha(update/2.4)
	draw_set_colour(c_aqua)
	draw_rectangle(x + border, y + border, x + border + width, y + border + height, false)
	draw_set_alpha(1)
	if (update < 0.01) {
		update = 0	
	}
}