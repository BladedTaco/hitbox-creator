/// @description get initial offset and check for click
//if being clicked, do event
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + image_xscale, y + image_yscale)) { //check for collision with box
	if (point_in_rectangle(mouse_x, mouse_y, bounds[0], bounds[1], bounds[2], bounds[3])) { //check for boundaries
		selected = true;
		offset = [mouse_x - start_x, mouse_y - start_y]
		obj_canvas.selected = false;
	}
}