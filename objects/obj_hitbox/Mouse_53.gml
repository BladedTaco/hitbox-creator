/// @description get initial offset and check for click
//if being clicked, do event

var _m = [];
var _x = [];
_m = scr_get_rotated_position(mouse_x, mouse_y, _dir)
_x = scr_get_rotated_position(x, y, _dir)
if (point_in_rectangle(_m[0], _m[1], _x[0] - image_xscale/2, _x[1] - image_yscale/2, _x[0] + image_xscale/2, _x[1] + image_yscale/2)) { //check for collision with box
	if (point_in_rectangle(mouse_x, mouse_y, bounds[0], bounds[1], bounds[2], bounds[3])) { //check for boundaries
		with (obj_hitbox) {
			_m = scr_get_rotated_position(mouse_x, mouse_y, -_dir)
			_x = scr_get_rotated_position(x, y, -_dir)
			if (point_in_rectangle(_m[0], _m[1], _x[0] - image_xscale/2, _x[1] - image_yscale/2, _x[0] + image_xscale/2, _x[1] + image_yscale/2)) { //check for collision with box
				if (index < other.index) { //this hitbox is on top
					selected = false;
					exit; //stop execution
				}
			}
		}
		selected = true;
		offset = [mouse_x - start_x*obj_canvas.zoom, mouse_y - start_y*obj_canvas.zoom]
		obj_canvas.selected = false;
	}
}