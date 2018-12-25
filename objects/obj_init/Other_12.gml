/// @description load/reload old sprite sheets
//load sprite array
if (file_exists("sprite_array")) { //able to load sprite sheets
	//load in the sprite sheet file locations
	var _data = ds_map_secure_load("sprite_array")
	var _temp = ds_list_create()
	ds_list_read(_temp, _data[? "sprite_array"])
	sprite_array = _temp[| 0]
	ds_map_destroy(_data)
	ds_list_destroy(_temp)
} else { //failed to load, reload old sprite sheets
	event_user(1)
}
show_debug_message(sprite_array)
sprite_num = array_height_2d(sprite_array)

for (var i = 0; true; i++) { //for as long as it takes
	var _file = "Surfaces\\Surface_" + string(i) //get the surface file
	if (file_exists(_file)) { //check if the file exists
		//create and populate the surface
		surface[i] = surface_create(8192, 8192)
		sprite_replace(sprite, _file, 1, false, false, 0, 0)
		surface_set_target(surface[i])
		draw_sprite(sprite, 0, 0, 0)
		surface_reset_target()
	} else { //no more surfaces
		break; //break the loop
	}
}