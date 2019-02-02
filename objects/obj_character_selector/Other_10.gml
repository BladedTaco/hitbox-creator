/// @description create character buttons

//remove any old buttons
with (obj_button_character) {
	instance_destroy();	
}

//create all character buttons
var _str = ""
var _inst = noone
for (var i = 0; i < array_height_2d(obj_data.sprite_array); i++) {
	_str = obj_data.sprite_array[i, NAME]
	if (string_copy(_str, 9, 5) = "stock") {
		_inst = instance_create_depth(x + 8 + 76*instance_number(obj_button_character), y + 3, 0, obj_button_character)
		with (_inst) {
			character = string_copy(_str, 5, 3)
			event_user(0)
		}
	}
}

max_x = max(76*(instance_number(obj_button_character)) + 4 - image_xscale, 0)