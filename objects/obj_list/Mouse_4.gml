/// @description change sprite
var _spr = -1
var _x = x + 2*border
var _y = y + 65 + (current_index - menu_index)*16

if (instance_exists(obj_init_helper)) {
	var _mx = _x + 5
	var _my = y + 70
} else {
	var _mx = mouse_x
	var _my = mouse_y
}
if (point_in_rectangle(_mx, _my, _x, _y - 7, _x + string_width(list[current_index]), _y + 7)) {
	//get sprite
	for (var i = 0; i < array_height_2d(obj_data.sprite_array); i++) {
		if (string("spr_" + character + "_" + list[current_index]) = obj_data.sprite_array[i, NAME]) {
			_spr = i
			break;
		}
	}
}

if (_spr > -1) {
	if ((obj_hitbox_table.saved = false) and (obj_button_save.x > 0)) {
		if (show_question("Would you like to save first?")) {
			with (obj_hitbox_table) {
				event_user(1)
			}
		}
	}
	//free canvas if needed, and re make canvas
	with (obj_canvas) {
		sprite = _spr
		frame = 0
		if (surface_exists(canvas)) {
			surface_free(canvas)	
		}
		event_user(0)
	}
	with (obj_hitbox_table) {
		sprite = _spr
		frame = 0
		event_user(0)	
		saved = true;
	}
}
