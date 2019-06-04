/// @description populate surface
//make sure the surface exists
if (!surface_exists(surface)) {
	surface = surface_create(512, 512)	
}

max_y = max(0, border + array_length_1d(name)*separation - height) //set the max y offset

//make sure the surface is large enough
while (surface_get_height(surface) < max_y + height) {
	surface_resize(surface, surface_get_width(surface), surface_get_height(surface)*2)	
}

surface_set_target(surface) //set the draw target

//draw the background
draw_clear(c_ltgray)
draw_set_colour(c_dkgray)
for (var i = 0; i <= array_length_1d(name); i+=2) {
	draw_rectangle(0, (i-1)*separation, 512, i*separation, false)
}

//draw each entry
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_colour(c_black)
for (i = array_length_1d(name) - 1; i >= 0; i--) {
	//set draw colour
	if (i mod 2 = 0) {
		draw_set_colour(c_black)
	} else {
		draw_set_colour(c_white)
	}
	//draw text
	draw_text(border, border + i*separation, name[i]) 	
	draw_text(border + separation, border + (i+0.5)*separation, desc[i]) 	
}


surface_reset_target()

//if (array_length_1d(name) > 0) { //the clipboard has data
//	obj_button_export_clipboard.x = abs(obj_button_export_clipboard.x)
//} else { //the clipboard does not have data
//	obj_button_export_clipboard.x = -abs(obj_button_export_clipboard.x)
//}