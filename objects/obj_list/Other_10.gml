/// @description populate list
var _str = ""
list = []
for (var i = 0; i < array_height_2d(obj_data.sprite_array); i++) {
	_str = obj_data.sprite_array[i, NAME]
	if (string_copy(_str, 5, 3) = character) {
		list[array_length_1d(list)] = string_copy(_str, 9, 100)
	}
}
menu_index = 0