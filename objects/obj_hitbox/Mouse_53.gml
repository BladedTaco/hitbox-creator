/// @description get initial offset and check for click
//if being clicked, do event
if (point_in_rectangle(mouse_x, mouse_y, x - image_xscale/2, y - image_yscale/2, x + image_xscale/2, y + image_yscale/2)) { //check for collision with box
	if (point_in_rectangle(mouse_x, mouse_y, bounds[0], bounds[1], bounds[2], bounds[3])) { //check for boundaries
		with (obj_hitbox) {
			if (point_in_rectangle(mouse_x, mouse_y, x - image_xscale/2, y - image_yscale/2, x + image_xscale/2, y + image_yscale/2)) { //check for collision with box
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