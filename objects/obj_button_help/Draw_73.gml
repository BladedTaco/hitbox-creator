/// @description draw help if needed

// Inherit the parent event
event_inherited();

if (image_blend = c_dkgray) { //draw help
	//darken screen
	draw_set_alpha(0.75)
	draw_set_colour(c_black)
	draw_rectangle(-1, -1, room_width + 1, room_height + 1, false)
	
	//get the objects
	var _len = array_length_1d(object_list)
	var o;
	
	//draw each region in a different colour
	for (var i = _len - 1; i >= 0; i--) {
		o = object_list[i]
		draw_set_colour(make_colour_hsv(255*i/_len, 255, 200))
		draw_rectangle(o.x + o.border, o.y + o.border, o.x + o.width, o.y + o.height, false)
	}
	
	//reset the draw variables
	draw_set_alpha(1)
	draw_set_colour(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
	//draw the help text for each area
	for (var i = text_length - 1; i >= 0; i--) {
		draw_text(text_array[i, 0], text_array[i, 1], text_array[i, 2])
	}
}