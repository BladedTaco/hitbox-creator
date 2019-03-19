///@func scr_read_sprite(name, surface)
///@param name - the name of the sprite to load
///@param surface - the surface number to draw to
///@desc loads the details of the sprite
var _height, _width, _x, _y, _file, _str, _img, _id;
_img = []
//get the file
_file = working_directory + "SPRITES\\" + argument[0] + "\\" + argument[0] + ".yy"
if (file_exists(_file)) { //check if the file exists
	_file = file_text_open_read(_file) //open the file
	
	//read id
	file_text_readln(_file);
	_id = string_copy(file_text_readln(_file), 12, 36)
	
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
	//TODO see if this +1 changes anything. One also below
	_height = real(string_digits(_str)) + 1//read the height
	
	//read through the file until the width is found
	while (true) {
		_str = file_text_read_string(_file)
		if (string_copy(_str, 6, 5) = "width") {
			break;
		} else {
			file_text_readln(_file)	
		}
	}
	_width = real(string_digits(_str)) + 1//read the width
	
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
			surface_set_target(surface[argument[1]])
			draw_sprite(sprite, 0, i*_width, sprite_y)
			surface_reset_target()
		}
	}
	//add to frame max
	frame_max = max(frame_max, array_length_1d(_img))
	
	sprite_array[sprite_num, NAME] = argument[0] //name
	sprite_array[sprite_num, YPOS] = sprite_y //yposition
	sprite_array[sprite_num, NUM] = array_length_1d(_img) //image number
	sprite_array[sprite_num, WIDTH] = _width //width
	sprite_array[sprite_num, HEIGHT] = _height //height
	sprite_array[sprite_num, X_OFF] = _x //x offset
	sprite_array[sprite_num, Y_OFF] = _y //y offset
	sprite_array[sprite_num, SURFACE] = argument[1] //surface accessor
	sprite_array[sprite_num, ID] = _id //sprite id
	
	sprite_y += _height //add height on surface to prevent layering
	sprite_num += 1 //add a sprite to the counter
	//increase max surface width for later use
	surface_width = max(surface_width, _width*array_length_1d(_img))
	
	return true //return a successful operation
}
return false //return a failure to load sprite data