/// @description
if (!surface_exists(surface)) {
	surface = surface_create(128, 128)
}
//clear surface
surface_set_target(surface)
draw_clear_alpha(c_aqua, 0)
surface_reset_target()
//get new sprite
var _str = ""
for (var i = 0; i < array_height_2d(obj_data.sprite_array); i++) {
	_str = obj_data.sprite_array[i, NAME]
	if (_str = "spr_" + character + "_stock") {
		surface_set_target(surface)
		draw_surface_part_ext(	
			obj_data.surface[obj_data.sprite_array[i, SURFACE]], 
			0, 
			obj_data.sprite_array[i, YPOS], 
			obj_data.sprite_array[i, WIDTH], 
			obj_data.sprite_array[i, HEIGHT],
			2,
			2, 
			4, 4, c_white, 1 //draw modifiers
		)
		surface_reset_target()
	}
}