/// @description populate surface
var i, o;
if (surface_exists(surface)) {
	var _table = table_list[frame]
	max_y[frame] = max(0, (array_height_2d(_table)-9)*23) //update max_y
	
	if (max_y[frame] + height > surface_get_height(surface)) { //surface too small
		//recreate surface bigger
		surface_resize(surface, surface_get_width(surface), surface_get_height(surface)*2)
	}

	saved = false;
	update = 1;
	var _surf_height = surface_get_height(surface)
	
	surface_set_target(surface)

	draw_set_valign(fa_top)
	draw_set_halign(fa_center)
	draw_rectangle_colour(0, 0, 1024, _surf_height, c_ltgray, c_ltgray, c_gray, c_gray, false)

	if (_table[0, 0] + _table[1, 0] != -20) { //data
		for (i = 0; i < 13; i++) {
			draw_rectangle_colour(i*64 - 32, 0, i*64, _surf_height, c_dkgray, c_dkgray, c_black, c_black, false)
		}
		if (i > 2) { //if there is data
			draw_rectangle_colour(i*64 - 32, 0, i*64, _surf_height, c_red, c_red, c_maroon, c_maroon, false)
			draw_rectangle_colour(i*64, 0, i*64 + 32, _surf_height, c_teal, c_teal, c_aqua, c_aqua, false)
		}
		hitbox = true
		for (i = 0; i < array_height_2d(_table); i++) {
			if ((_table[i, 0] - 1 < SHAPE_NUMBER) && (_table[i, 0] > 0)) {
				_table[i, 0] = SHAPES[_table[i, 0]-1]
			}
			if (_table[i, 0] = -10) {
				//do the alt title columns
				for (o = 0; o < array_length_1d(title_alt); o++) {
					if (o mod 2 = 0) {		
						draw_set_colour(c_black)
						if (o < array_length_1d(title_alt) - 2) {
							draw_rectangle_colour(o*32 + 1, (i+1)*23, o*32 + 31, _surf_height, $dfa0df, $dfa0df, $fafffa, $fafffa, false)
						}
					} else {
						draw_set_colour(c_white)
						if (o < array_length_1d(title_alt) - 2) {
							draw_rectangle_colour(o*32, (i+1)*23, o*32 + 31, _surf_height, $300030, $300030, $003000, $003000, false)
						}
					}
					draw_text(16 + o*32, (i+1)*23, title_alt[o])
				}
				draw_set_colour(c_white)
				draw_text(838, (i+1)*23, "*")
			} else {
				draw_set_colour(c_white)
				draw_text(816, (i+1)*23, "X")
				draw_text(838, (i+1)*23, "*")
				for (o = 0; o < array_length_2d(_table, i); o++) {
					if (o mod 2 = 0) {
						draw_set_colour(c_black)
					} else {
						draw_set_colour(c_white)
					}
					if (string_copy(string(_table[i, o]), 1, 1) = "-") { //negative number
						draw_set_colour(c_red)	
						draw_text(16 + o*32, (i+1)*23, string_copy(string(_table[i, o]), 2, 3))
					} else {
						draw_text(16 + o*32, (i+1)*23, string_copy(string(_table[i, o]), 1, 3))
					}
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
		//show no hitboxes and destroy all hitbox objects
		draw_set_colour(c_black)
		draw_text(width/2, 0, "NO HITBOXES OR HURTBOXES")
		hitbox = false
	}
	surface_reset_target()
	
	if (hitbox) { //if there is data
		obj_button_clipboard.x = abs(obj_button_clipboard.x) //make sure clipboard button is visible
		with (obj_hitbox) {
			instance_destroy();
			obj_canvas.hitboxes = [];
		}
		var _boxes = [];
		for (i = array_height_2d(_table) - 1; i >= 0; i--) { //for each hitbox
			if (i < hurtbox[frame]) { //if not the seperator
				//make the hitbox
				_boxes[i] = instance_create_depth(0, 0, i, obj_hitbox)
				with (_boxes[i]) {
					hitbox_colour = HITBOX_COL_.HITBOX
					index = i
					event_user(0)
				}
			} else if (i > hurtbox[frame]) { //if not the seperator
				//make the hitbox
				_boxes[i-1] = instance_create_depth(0, 0, i, obj_hitbox)
				with (_boxes[i-1]) {
					hitbox_colour = HITBOX_COL_.HURTBOX
					index = i
					event_user(0)
				}
			}
		}
		obj_canvas.hitboxes = _boxes;
	} else {
		with (obj_hitbox) {
			instance_destroy();
			obj_canvas.hitboxes = [];
		}
		obj_button_clipboard.x = -abs(obj_button_clipboard.x) //make sure clipbaord button is invisible
	}

}