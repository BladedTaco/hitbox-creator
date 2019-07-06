/// @description 
event_inherited();


////EXPORT TABLE
//if (show_question("Export hitboxes to save file?")) {
//	scr_export(0); //start exporting
//}

/*

if (false) {
	var _f = file_text_open_append("TEST_FILE")
	var _str = ""
	_str += "Hello There"
	_str += "\n"
	_str += "General Kenobi"
	_str += "\n\n"
	_str += "*screeching*"

	file_text_write_string(_f, _str)
	file_text_close(_f);
} else {
	var _f = file_text_open_read("TEST_FILE")

		show_debug_message(file_text_read_string(_f))
		file_text_readln(_f)
	file_text_close(_f);
}



var _str = "1234567890\nu"
_str = string_delete(_str, string_length(_str)-1, 1)
show_debug_message(_str)

