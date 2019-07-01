/// @description check for activation of hitboxes

if (active) {
	//if being clicked, do event
	var _update = false;
	var _check = true;
	for (var i = 0; i < array_length_1d(hitboxes); i++) {
		with (hitboxes[i]) { //check if another hitbox is on top
			if (selected) { //was in multi select
				//check for multi hitbox selecting
				if (keyboard_check(vk_control)) {
					offset = [mouse_x - start_x*obj_canvas.zoom, mouse_y - start_y*obj_canvas.zoom]
					obj_canvas.selected = false;
				} else { //end multi select
					_update = true;
					offset = [0, 0]
					selected = false;
				}
			} else if (_check) { //if collision needs to be checked
				var _m = [];
				var _x = [];
				_m = scr_get_rotated_position(mouse_x, mouse_y, image_angle)
				_x = scr_get_rotated_position(x, y, image_angle)
				if (point_in_rectangle(_m[0], _m[1], _x[0] - image_xscale/2, _x[1] - image_yscale/2, _x[0] + image_xscale/2, _x[1] + image_yscale/2)) { //check for collision with box
					if (point_in_rectangle(mouse_x, mouse_y, bounds[0], bounds[1], bounds[2], bounds[3])) { //check for boundaries of canvas
						selected = true; //set as selected
						if (keyboard_check(vk_shift)) { //resizing
							//set offset and side of selection
							offset = [_m[0], _m[1]]
							side = [sign(_m[0] - _x[0]), sign(_m[1] - _x[1])]
							
							//check for single dimension resizing
							if (abs(_m[0] - _x[0])/other.zoom < start_width/6) {
								side[0] = 0
							}
							if (abs(_m[1] - _x[1])/other.zoom < start_height/6) {
								side[1] = 0
							}
							
							//check for rotating
							if ((side[0] == 0) and (side[1] == 0)) {
								rotating = true;
								offset = [image_angle, -point_direction(x, y, mouse_x, mouse_y)]
							}
						} else { //moving
							offset = [mouse_x - start_x*obj_canvas.zoom, mouse_y - start_y*obj_canvas.zoom]
						}
						obj_canvas.selected = false;
						if (instance_exists(obj_button_hitbox_single_select)) { //if single select mode
							_check = false
						}
					}
				}
			}
		}
	}

	//see if the table needs to be updated
	if (_update) {
		with (obj_hitbox_table) {
			event_user(2)	
		}
	}
}