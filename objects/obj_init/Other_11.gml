/// @description Load in sprites
//reset some variables in case this is a recall
surface = []
surface_width = 0
buffer = []
sprite_y = 0
sprite_num = 0
sprite_array = [] // NAME | YPOS | NUM | WIDTH | HEIGHT | X_OFF | Y_OFF | SURFACE | REAL NUMBER 
mode = 0
image = 0

//copy the directory
show_debug_message("COPYING DIRECTORY")
directory_copy_fmns("C:\\Users\\v2tac\\Desktop\\The catalyst\\Atavistic Sanctum\\Atavistic Sanctum\\sprites\\", working_directory + "SPRITES\\")

show_debug_message("FINDING CHARACTERS")
var _file = file_find_first(working_directory + "SPRITES\\pal_*", fa_directory) //find the first pallet sprite
var _char = []
while (_file != "") {
	_char[array_length_1d(_char)] = string_copy(_file, string_length(_file) - 2, 3)
	_file = file_find_next()
	surface[array_length_1d(surface)] = surface_create(power(2, SURFACE_POWER), power(2, SURFACE_POWER))
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
	
	//trim surface
	//get power of 2 surface width fits into
	for (var o = SURFACE_POWER; o > 0; o--) {
		if (surface_width > power(2, o-1)) {
			break;
		}
	}
	for (var j = SURFACE_POWER; j > 0; j--) {
		if (sprite_y > power(2, j-1)) {
			break;
		}
	}
	//resize surface
	var _surf = surface_create(power(2, SURFACE_POWER), power(2, SURFACE_POWER)) //create temporary surface
	surface_copy(_surf, 0, 0, surface[i]) //copy surface to temp surface
	surface_resize(surface[i], power(2, o), power(2, j)) //resize surface
	surface_copy(surface[i], 0, 0, _surf) //copy temp surface back to resized surface
	surface_free(_surf) //free the temp surface
	show_debug_message(string(surface_get_width(surface[i])) + "  " + string(surface_get_height(surface[i])))

	//reset variables and save the surface
	sprite_y = 0
	surface_width = 0
	surface_save(surface[i], "Surfaces\\Surface_" + string(i))
}

show_debug_message("CLEARING DIRECTORY")
if (directory_exists_fmns(working_directory + "SPRITES\\")) {
	directory_destroy_fmns(working_directory + "SPRITES\\")	
}

//sort sprite ids
show_debug_message("COPYING VIEW DIRECTORY")
directory_copy_fmns("C:\\Users\\v2tac\\Desktop\\The catalyst\\Atavistic Sanctum\\Atavistic Sanctum\\views\\", working_directory + "VIEWS\\")

_file = []

//"2842a6b5-5a70-40cb-a868-36a692e71c2e" sptire view
_file[0] = file_find_first(working_directory + "VIEWS\\*", fa_directory) //find the first pallet sprite
while (_file[0] != "") {
	_file[1] = file_text_open_read(working_directory + "VIEWS\\" + _file[0])
	do {
		if (string_copy(file_text_readln(_file[1]), 20, 7) = "sprites") {
			//sprites view has been found
			file_find_close();
			//call script to recursively sort ids
			scr_sort_ids(string_replace(_file[0], ".yy", ""))
			break;
		}
	} until (file_text_eof(_file[1]))
	//check if list has been ordered and if so break loop
	if (file_text_eof(_file[1])) {
		file_text_close(_file[1])
		_file[0] = file_find_next()
	} else {
		file_text_close(_file[1])
		break;
	}	
}


//add id data to sprite array
show_debug_message("ADDING IDS TO SPRITE ARRAY")
for (i = 0; i < array_length_1d(sprite_list); i++) {
	for (o = 0; o < array_height_2d(sprite_array); o++) {
		if (sprite_array[o, ID] = sprite_list[i]) {
			sprite_array[o, ID] = i
			break;
		}
	}
}


//sort array
show_debug_message("SORTING SPRITE ARRAY")
sprite_array = array_sort_2d(sprite_array, 0, ID)

show_debug_message(sprite_array)

//save array to file
var _data = ds_map_create()
var _temp = ds_list_create()
_temp[| 0] = sprite_array
_data[? "sprite_array"] = ds_list_write(_temp)
ds_map_secure_save(_data, "sprite_array")
ds_map_destroy(_data)
ds_list_destroy(_temp)


event_user(3) //hand off data to data object