///@func scr_read_sprite(name)
///@param name - the name of the sprite to load
///@desc loads the details of the sprite
var _height, _width, _x, _y, _file, _str, _img
_img = []
//get the file
_file = working_directory + "SPRITES\\" + argument[0] + "\\" + argument[0] + ".yy"
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
	_height = real(string_digits(_str)) //read the height
	
	//read through the file until the width is found
	while (true) {
		_str = file_text_read_string(_file)
		if (string_copy(_str, 6, 5) = "width") {
			break;
		} else {
			file_text_readln(_file)	
		}
	}
	_width = real(string_digits(_str)) //read the height
	
	//read the origin
	file_text_readln(_file)
	_x = real(string_digits(file_text_read_string(_file))) //read the height
	file_text_readln(_file)
	_y = real(string_digits(file_text_read_string(_file))) //read the height
	
	file_text_close(_file) //close the file
	
	//load the images
	for (var i = 0; i < array_length_1d(_img); i++) {
		_file = working_directory + "SPRITES\\" + argument[0] + "\\" + _img[i] + ".png" //get the file
		if (file_exists(_file)) { //check if the file exists
			sprite_replace(sprite, _file, 1, false, false, 0, 0)
			surface_set_target(surface)
			draw_sprite(sprite, 0, i*_width, sprite_y)
			surface_reset_target()
		}
	}
	sprite_array[sprite_num, 0] = argument[0] //name
	sprite_array[sprite_num, 1] = sprite_y //yposition
	sprite_array[sprite_num, 2] = array_length_1d(_img) //image number
	sprite_array[sprite_num, 3] = _width //width
	sprite_array[sprite_num, 4] = _height //height
	sprite_array[sprite_num, 5] = _x //x offset
	sprite_array[sprite_num, 6] = _y //y offset
	
	sprite_y += _height //add height on surface to prevent layering
	sprite_num += 1 //add a sprite to the counter
	return true //return a successful operation
}
return false //return a failure to load sprite data