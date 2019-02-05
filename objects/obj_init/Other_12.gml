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

//get frame max
for (var i = sprite_num - 1; i >= 0; i--) {
	frame_max = max(frame_max, sprite_array[i, NUM])	
}

event_user(0) //create surfaces

event_user(3) //hand off data to data object