/// @description show description

if ((sprite > -1) and (frame > -1) and data) { //if there is data to edit
	var _mx = window_mouse_get_x() - x
	var _my = window_mouse_get_y() - y
	var _table = table_list[frame] //get array

	if ((_mx > 0) and (_mx < width)) {
		_mx = clamp(floor(_mx/33), 0, 24) //get x index
		_my = floor(_my/23) - 1	//get y index
		if (_my = -1) { //show description
			show_message(desc[_mx])
		} else if (_my < array_height_2d(_table)) { //change value
			if (_my < hurtbox[frame]) {
				_table[@ _my, _mx] = get_integer("Change value for hitbox " + string(_my) + " - " + string(title[_mx]), _table[_my, _mx])
			} else if (_my > hurtbox[frame]) {
				_table[@ _my, _mx] = get_integer("Change value for hurtbox " + string(_my - hurtbox[frame] - 1) + " - " + string(title[_mx]), _table[_my, _mx])
			}
			event_user(2)
		}
	}
}