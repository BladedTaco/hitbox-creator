/// @description draws for selection mode
if (selection_mode) {
	//grey out surrounding
	draw_set_alpha(0.75)
	draw_set_colour(c_dkgray)
	draw_rectangle(-10, -10, room_width + 10, y, false)	
	draw_rectangle(-10, y + height, room_width + 10, room_height + 10, false)	
	draw_rectangle(-10, y + 1, x, y + height - 1, false)	
	draw_rectangle(x + width, y + 1, room_width + 10, y + height - 1, false)	
	
	
	var _my
	
	//draw between hover if needed
	if ((active) and (caller_type = BETWEEN)) {
		draw_set_colour(c_aqua)
		draw_set_alpha(0.4)
		_my = floor((mouse_y - y + 12 + y_off[frame])/23) - 1
		if ((_my <= array_height_2d(table_list[frame])) and (_my >= 0)) { //acceptable range
			_my += 1 - y_off[frame]/23
			draw_line_width(x, max(y + _my*23 - 2, y), x + width, min(y + _my*23 - 2, y + height), 6)
			_my -= 1 - y_off[frame]/23
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
	
	var control_string = @"Left Click -- select hitbox, end selection
Shift + Left Click -- Toggle range of hitboxes
Ctrl + Left Click -- Toggle a hitboxes selection
Right Click -- To cancel selection"
	
	if (!caller_multiselect) {
			var control_string = @"Left Click -- select hitbox and end selection
Right Click -- To cancel selection"
	}
	
	draw_set_alpha(1)
	draw_set_colour(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text(225, 200, caller_string)
	draw_text(225, 300, control_string)
}