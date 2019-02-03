/// @description 
event_inherited();
with (obj_canvas) {
	if (rainbow_mode) {
		rainbow_mode = false
		canvas_colour = other.colour
	} else if (canvas_colour != other.colour) {
		canvas_colour = other.colour
	} else {
		rainbow_mode = true;
	}
}