/// @description draws for selection mode
if (selection_mode) {
	//grey out surrounding
	draw_set_alpha(0.75)
	draw_set_colour(c_dkgray)
	draw_rectangle(-10, -10, room_width + 10, y, false)	
	draw_rectangle(-10, y + height, room_width + 10, room_height + 10, false)	
	draw_rectangle(-10, y + 1, x, y + height - 1, false)	
	draw_rectangle(x + width, y + 1, room_width + 10, y + height - 1, false)	
	
	draw_set_colour(c_blue)
	draw_set_alpha(0.4)
	var _my
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
	
	draw_set_alpha(1)
	draw_set_colour(c_white)
	draw_text(200, 200, caller_string)
}