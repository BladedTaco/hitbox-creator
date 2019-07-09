

var _str = ""

_str = "hello_there = [0, 1, 2, 3, 4, 5, 6, 7, 8]"




var _file = file_text_open_write("Local Hitbox Copy.txt")
file_text_write_string(_file, _str)
file_text_close(_file)

var _file = file_text_open_write("I:\\TEST\\TEST_OUTPUT.txt")
file_text_write_string(_file, _str)
file_text_close(_file)