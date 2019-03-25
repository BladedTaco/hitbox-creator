/// @description populate surface

if (surface_exists(surface)) {
	surface_set_target(surface)

	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_rectangle_colour(0, 0, 1024, 512, c_aqua, c_lime, c_orange, c_fuchsia, false)
	var _table = table_list[frame]
	for (var i = 0; i < array_height_2d(_table); i++) {
		if (_table[i, 0] = -10) {
			draw_text(0, i*23, string("  /\\ /\\ /\\ /\\ HITBOXES ||||||  HURTBOXES \\/ \\/ \\/ \\/"))
		} else {
			for (var o = 0; o < array_length_2d(_table, i); o++) {
				draw_text(o*32, i*23, string(_table[i, o]))
			}	
		}
	}

	surface_reset_target()
}