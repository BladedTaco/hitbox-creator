/// @description check for activation of hitboxes
//if being clicked, do event

for (var i = 0; i < array_length_1d(hitboxes); i++) {
	with (hitboxes[i]) { //check if another hitbox is on top
		if (selected and keyboard_check(vk_control)) {
			offset = [mouse_x - start_x*obj_canvas.zoom, mouse_y - start_y*obj_canvas.zoom]
			obj_canvas.selected = false;
		} else {
			var _m = [];
			var _x = [];
			_m = scr_get_rotated_position(mouse_x, mouse_y, image_angle)
			_x = scr_get_rotated_position(x, y, image_angle)
			if (point_in_rectangle(_m[0], _m[1], _x[0] - image_xscale/2, _x[1] - image_yscale/2, _x[0] + image_xscale/2, _x[1] + image_yscale/2)) { //check for collision with box
				if (point_in_rectangle(mouse_x, mouse_y, bounds[0], bounds[1], bounds[2], bounds[3])) { //check for boundaries of canvas
					selected = true; //set as selected
					offset = [mouse_x - start_x*obj_canvas.zoom, mouse_y - start_y*obj_canvas.zoom]
					obj_canvas.selected = false;
					if (instance_exists(obj_button_hitbox_single_select)) { //if single select mode
						exit;
					}
				}
			}
		}
	}
}