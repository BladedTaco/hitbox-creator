/// @description 
event_inherited();
with (obj_hitbox_table) {
	var _int = get_integer("which row would you like to insert the hitbox", 0)
	if (_int <= hurtbox[frame]) {
		hurtbox[frame]++	
	}
	scr_array_add_entry(table_list[frame], _int,
	0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
	
	event_user(2)
}