/// @description Load in sprites
//copy the directory
show_debug_message("COPYING DIRECTORY")
directory_copy_fmns("C:\\Users\\v2tac\\Desktop\\The catalyst\\Atavistic Sanctum\\Atavistic Sanctum\\sprites\\", working_directory + "SPRITES\\")

show_debug_message("FINDING CHARACTERS")
var _file = file_find_first(working_directory + "SPRITES\\pal_*", fa_directory) //find the first pallet sprite
var _char = []
while (_file != "") {
	_char[array_length_1d(_char)] = string_copy(_file, string_length(_file) - 2, 3)
	_file = file_find_next()
	surface[array_length_1d(surface)] = surface_create(8192, 8192)
	surface_set_target(surface[array_length_1d(surface)-1])
	draw_clear_alpha(c_white, 0)
	surface_reset_target()
}
file_find_close();
show_debug_message(_char)
for (var i = 0; i < array_length_1d(_char); i++) {
	_file = file_find_first(working_directory + "SPRITES\\spr_" + _char[i] + "*", fa_directory) //find the first balloony sprite
	while (_file != "") {
		if (scr_read_sprite(_file, i)) {
			show_debug_message("SUCCESS")
		} else {
			show_debug_message("FAILURE")	
		}
		_file = file_find_next()
	}
	file_find_close()
	sprite_y = 0
	surface_save(surface[i], "Surfaces\\Surface_" + string(i))
}

show_debug_message("CLEARING DIRECTORY")
if (directory_exists_fmns(working_directory + "SPRITES\\")) {
	directory_destroy_fmns(working_directory + "SPRITES\\")	
}

show_debug_message(sprite_array)

//save array to file
var _data = ds_map_create()
var _temp = ds_list_create()
_temp[| 0] = sprite_array
_data[? "sprite_array"] = ds_list_write(_temp)
ds_map_secure_save(_data, "sprite_array")
ds_map_destroy(_data)
ds_list_destroy(_temp)