/// @description load variables
if (obj_hitbox_table.hitbox) {
	var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
	shape = _table[index, 0]
	image_xscale = _table[index, 1]
	image_yscale = _table[index, 2]
	x = _table[index, 3]
	y = _table[index, 4]
	image_angle = _table[index, 5]
	visible = true;
} else {
	shape = 0
	image_xscale = 0
	image_yscale = 0
	x = 0
	y = 0
	image_angle = 0
	visible = false;
}