/// @description 
if (active) {
	if (keyboard_check(vk_shift)) {
		if ((sprite >= 0) and (frame >= 0) and hitbox) {
			var _mx = mouse_x - x
			var _my = mouse_y - y
			var _table = table_list[frame] //get array
			_mx = clamp(floor(_mx/spacing), -1, 26) //get x index
			_my = floor((_my + y_off[frame])/23) - 1	//get y index

			if ((_mx > -1) and (_mx < 25) and (_my >= 0) and (_my < array_height_2d(_table)) and (_my != hurtbox[frame])) { //if hitbox
				if (_my < hurtbox[frame]) { //hitbox
					_table[@ _my, _mx] = clamp(_table[@ _my, _mx] + inc_val[_mx], min_val[_mx], max_val[_mx])
				} else { //hurtbox
					_table[@ _my, _mx] = clamp(_table[@ _my, _mx] + inc_val_alt[_mx], min_val_alt[_mx], max_val_alt[_mx])
				}
				event_user(2) //update table
			}
		}
	} else {
		y_off[frame] = clamp(y_off[frame] - 12, 0, max_y[frame])	
	}
}