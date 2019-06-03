/// @description import clipboard
//load sprite array
if (file_exists("clipboard_data")) { //able to load sprite sheets
	//load in the sprite sheet file locations
	var _data = ds_map_secure_load("clipboard_data")
	var _temp = ds_list_create()
	ds_list_read(_temp, _data[? "clipboard_data"])
	name = _temp[| 0]
	desc = _temp[| 1]
	hitbox = _temp[| 2]
	data = _temp[| 3]
	sprite = _temp[| 4]
	ds_map_destroy(_data)
	ds_list_destroy(_temp)
	show_debug_message("CLIPBOARD LOADED")
}
