/// @description 
draw_set_halign(fa_right)
draw_set_colour(c_white)
for (var i = 0; i < 9; i++) {
	draw_text(-10 + x, i*1000 + y, string(i*1000))
	draw_line_width_colour(-100 + x, i*1000 + y, -50, 0, 2, c_white, c_aqua)
}