/// @description handle settings menu

if (async_load[? "id"] = menu) { //handle the menu screen
	if (async_load[? "status"]) { //number input
		switch (async_load[? "value"]) {
			case 0: //exit
				exit //do nothing
			break;
			
			case 1: //change output file
				var _file = get_save_filename("Output File - Gamemaker Code File|*.gml", "")
				if (file_exists(_file)) {
					show_debug_message(_file)
					global.output_file = _file
					menu = get_integer_async(
@"Settings Menu
0 - Exit
1 - Change output file: SUCCESS
2 - Change input folder
3 - Export Settings", "")
				} else { //it failed
					menu = get_integer_async(
@"Settings Menu
0 - Exit
1 - Change output file: FAILURE
2 - Change input folder
3 - Export Settings", "")	
				}
			break;
			
			case 2: //change input folder
				//get the project file
				var _file = get_save_filename("Input Program - Gamemaker Project File|*.yyp", "")
				if (file_exists(_file)) { //if the file exists
					//get the directory
					var i = string_length(_file)
					while (string_char_at(_file, i) != "\\") {
						i--
						if (i = 0) {
							show_message("FATAL ERROR")
							exit;
						}
					}
					//save the result
					_file = string_copy(_file, 1, i)
					show_debug_message(_file)
					global.input_folder = _file
					menu = get_integer_async(
@"Settings Menu
0 - Exit
1 - Change output file
2 - Change input folder: SUCCESS
3 - Export Settings", "")
				} else { //it failed
					menu = get_integer_async(
@"Settings Menu
0 - Exit
1 - Change output file
2 - Change input folder: FAILURE
3 - Export Settings", "")	
				}
			break;
			
			case 3: //export input and output folders
				//save array to file
				var _data = ds_map_create()
				var _temp = ds_list_create()
				_temp[| 0] = global.input_folder
				_temp[| 1] = global.output_file
				_data[? "settings"] = ds_list_write(_temp)
				if (ds_map_secure_save(_data, "settings")) {
					menu = get_integer_async(
@"Settings Menu
0 - Exit
1 - Change output file
2 - Change input folder
3 - Export Settings: SUCCESS", "")	
				} else {
					menu = get_integer_async(
@"Settings Menu
0 - Exit
1 - Change output file
2 - Change input folder
3 - Export Settings: FAILURE", "")	
				}
				ds_map_destroy(_data)
				ds_list_destroy(_temp)
			break;
		}
	} else { //cancelled
		exit //do nothing
	}
}