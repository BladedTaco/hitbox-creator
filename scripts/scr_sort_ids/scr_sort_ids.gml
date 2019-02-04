///@func scr_sort_ids(sprites_view_file)
///@param sprites_view_file - the filename of the file that holds the sprite resource view data
///@desc gets a sorted list of sprite ids recursively

//base case. End recursion
if (!file_exists(working_directory + "VIEWS\\" + argument[0] + ".yy")) {
	sprite_list[array_length_1d(sprite_list)] = argument[0]
	return true //exit script
}

var _file, _str;
_file = file_text_open_read(working_directory + "VIEWS\\" + argument[0] + ".yy") //get the given file

//read past header info
repeat (6) {
	file_text_readln(_file)	
}

//read through file
while (true) {
	_str = file_text_readln(_file)
	if (_str != "    ],") { //not the end of the children
		scr_sort_ids(string_copy(_str, 10, 36))
	} else {
		file_text_close(_file)
		return true	//exit script
	}
}

return false //this point should be unreachable