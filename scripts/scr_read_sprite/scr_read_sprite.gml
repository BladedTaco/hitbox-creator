///@func scr_read_sprite(name)
///@param name - the name of the sprite to load
///@desc loads the details of the sprite
var _height, _width, _x, _y, _file, _str, _img
_img = []
//get the file
_file = "C:\\Users\\v2tac\\Desktop\\The catalyst\\Atavistic Sanctum\\Atavistic Sanctum\\sprites\\"
_file += argument[0] + "\\" + argument[0] + ".yy"
_file = file_copy_fmns(_file, working_directory + "TEMP_FILE")
_file = working_directory + "TEMP_FILE"
if (file_exists(_file)) { //check if the file exists
	_file = file_text_open_read(_file) //open the file
	
	//read through the file until the frame filenames are found and ordered
	while (true) {
		_str = file_text_read_string(_file)
		if (string_copy(_str, 5, 2) = "],") {
			break;	
		}
		if (string_copy(_str, 14, 2) = "id") {
			_img[array_length_1d(_img)] = string_copy(_str, 20, 36)
		} else {
			file_text_readln(_file)	
		}
	}
	
	//read through the file until the height is found
	while (true) {
		_str = file_text_read_string(_file)
		if (string_copy(_str, 6, 6) = "height") {
			break;
		} else {
			file_text_readln(_file)	
		}
	}
	_height = string_digits(_str) //read the height
	
	//read through the file until the width is found
	while (true) {
		_str = file_text_read_string(_file)
		if (string_copy(_str, 6, 5) = "width") {
			break;
		} else {
			file_text_readln(_file)	
		}
	}
	_width = string_digits(_str) //read the height
	
	//read the origin
	file_text_readln(_file)
	_x = real(string_digits(file_text_read_string(_file))) //read the height
	file_text_readln(_file)
	_y = real(string_digits(file_text_read_string(_file))) //read the height
	
	show_debug_message(_img)
	show_debug_message(_height)
	
	file_text_close(_file) //close the file
	file_delete_fmns(working_directory + "TEMP_FILE")
	return true //return a successful operation
}
return false //return a failure to load sprite