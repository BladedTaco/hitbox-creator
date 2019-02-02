/// @description pan around canvas
x_off -= event_data[? "diffX"]
x_off = clamp(x_off, 0, 100)
with (obj_button_character) {
	x = x_home - other.x_off	
}