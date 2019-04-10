/// @description populate surface

if (surface_exists(surface)) {
	surface_set_target(surface)

	draw_set_valign(fa_top)
	draw_set_halign(fa_center)
	draw_rectangle_colour(0, 0, 1024, 512, c_ltgray, c_ltgray, c_gray, c_gray, false)
	
	var _table = table_list[frame]
	
	if (_table[0, 0] + _table[1, 0] != -20) {
		for (var i = 0; i < 13; i++) {
			draw_rectangle_colour(i*64 - 32, 0, i*64, 1024, c_dkgray, c_dkgray, c_black, c_black, false)
		}
		if (i > 2) { //if there is data
			draw_rectangle_colour(i*64 - 32, 0, i*64, 1024, c_red, c_red, c_maroon, c_maroon, false)
			draw_rectangle_colour(i*64, 0, i*64 + 32, 1024, c_teal, c_teal, c_aqua, c_aqua, false)
		}
		hitbox = true
		for (i = 0; i < array_height_2d(_table); i++) {
			if (_table[i, 0] = -10) {
				draw_text(width/2, (i+1)*23, string("/\\ /\\ /\\ /\\ HITBOXES ||||||  HURTBOXES \\/ \\/ \\/ \\/"))
			} else {
				draw_set_colour(c_white)
				draw_text(816, (i+1)*23, "X")
				draw_text(838, (i+1)*23, "*")
				for (var o = 0; o < array_length_2d(_table, i); o++) {
					if (o mod 2 = 0) {
						draw_set_colour(c_black)
					} else {
						draw_set_colour(c_white)
					}
					draw_text(16 + o*32, (i+1)*23, string(_table[i, o]))
				}	
			}
		}
		for (i = 0; i < array_length_1d(title); i++) {
			if (i mod 2 = 0) {
				draw_set_colour(c_black)
			} else {
				draw_set_colour(c_white)
			}
			draw_text(16 + i*32, 0, title[i])
		}
		draw_set_colour(c_white)
		draw_text(838, 0, "*")
	} else {
		draw_text(width/2, 0, "NO HITBOXES OR HURTBOXES")
		hitbox = false
	}
	surface_reset_target()
}