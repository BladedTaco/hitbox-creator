/// @description draw list
draw_self();
draw_set_colour(c_ltgray)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)

draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_colour(c_black)

var _x, _y
_x = x + 2*border
for (var i = 0 ; i < min(array_length_1d(list), 50); i++) {
	_y = y + 65 + i*16
	if (point_in_rectangle(mouse_x, mouse_y, _x, _y - 7, _x + string_width(list[menu_index + i]), _y + 7)) {
		draw_set_colour(c_white)
		current_index = menu_index + i
	} else {
		draw_set_colour(c_black)
	}
	draw_text(_x, _y, list[menu_index + i])
}
