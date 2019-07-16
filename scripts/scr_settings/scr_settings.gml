global.output_file = ""
global.input_folder = ""

if (file_exists("settings")) { //able to load sprite sheets
	//load in the sprite sheet file locations
	var _data = ds_map_secure_load("settings")
	var _temp = ds_list_create()
	ds_list_read(_temp, _data[? "settings"])
	global.input_folder = _temp[| 0]
	global.output_file = _temp[| 1]
	ds_map_destroy(_data)
	ds_list_destroy(_temp)
}