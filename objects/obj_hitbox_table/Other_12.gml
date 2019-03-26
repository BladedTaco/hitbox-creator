/// @description populate surface

if (surface_exists(surface)) {
	surface_set_target(surface)

	draw_set_valign(fa_top)
	draw_set_halign(fa_center)
	draw_rectangle_colour(0, 0, 1024, 512, c_aqua, c_lime, c_orange, c_fuchsia, false)
	var _table = table_list[frame]
	if (_table[0, 0] + _table[1, 0] = -20) {
		draw_text(width/2, 0, "NO HITBOXES OR HURTBOXES")
	} else {
		for (var i = 0; i < array_height_2d(_table); i++) {
			if (_table[i, 0] = -10) {
				draw_text(width/2, i*23, string("/\\ /\\ /\\ /\\ HITBOXES ||||||  HURTBOXES \\/ \\/ \\/ \\/"))
			} else {
				draw_text(16, i*23, string(_table[i, 0]))
				for (var o = 1; o < array_length_2d(_table, i); o++) {
					draw_text(16 + o*33, i*23, string(_table[i, o]))
				}	
			}
		}
	}
	surface_reset_target()
}