///@func scr_read_sprite(name)
///@param name - the name of the sprite to load
///@desc loads the details of the sprite
var _height, _width, _x, _y, _file, _str
//get the file
_file = "C:\\Users\\v2tac\\Desktop\\The catalyst\\Atavistic Sanctum\\Atavistic Sanctum\\sprites\\"
_file += argument[0] + "\\" + argument[0] + ".yy"
_file = get_open_filename("YY file|*.yy", _file)
if (_file != "") { //check if the file exists
	_file = file_text_open_read(_file) //open the file
	
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
	
	file_text_close(_file) //close the file
	return true //return a successful operation
}
return false //return a failure to load sprite