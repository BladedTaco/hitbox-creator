/// @description load variables
if (obj_hitbox_table.hitbox) {
	var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
	shape = _table[index, 0]
	image_xscale = _table[index, 1]
	image_yscale = _table[index, 2]
	start_width = image_xscale
	start_height = image_yscale
	x = _table[index, 3]
	y = _table[index, 4]
	start_x = x
	start_y = y
	image_angle = _table[index, 5]
	visible = true;
	zoom = 0;
} else {
	shape = 0
	image_xscale = 0
	image_yscale = 0
	start_width = image_xscale
	start_height = image_yscale
	x = 0
	y = 0
	start_x = x
	start_y = y
	image_angle = 0
	visible = false;
	zoom = 0;
}

