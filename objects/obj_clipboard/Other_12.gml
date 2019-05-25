/// @description populate surface
surface_set_target(surface)
draw_clear(c_ltgray)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_colour(c_black)
for (var i = array_length_1d(name) - 1; i >= 0; i--) {
	draw_text(3, 3 + i*32, name[i]) 	
}

surface_reset_target()