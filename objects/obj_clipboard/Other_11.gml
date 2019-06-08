/// @description export clipboard
if (array_length_1d(name) = 0) { //no data
	//delete clipboard data file
	if (file_exists("clipboard_data")) {
		file_delete("clipboard_data")
	}
} else { //there is data
	//save array to file
	var _data = ds_map_create()
	var _temp = ds_list_create()
	_temp[| 0] = name
	_temp[| 1] = desc
	_temp[| 2] = hitbox
	_temp[| 3] = data
	_temp[| 4] = sprite
	_temp[| 5] = frame
	_data[? "clipboard_data"] = ds_list_write(_temp)
	ds_map_secure_save(_data, "clipboard_data")
	ds_map_destroy(_data)
	ds_list_destroy(_temp)
}