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

//draw each entry
surface_set_target(surface)
draw_clear(c_ltgray)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_colour(c_black)
for (var i = array_length_1d(name) - 1; i >= 0; i--) {
	draw_text(border, border + i*separation, name[i]) 	
	draw_text(border + separation, border + (i+0.5)*separation, desc[i]) 	
}


surface_reset_target()

if (array_length_1d(name) > 0) { //the clipboard has data
	obj_button_export_clipboard.x = abs(obj_button_export_clipboard.x)
} else { //the clipboard does not have data
	obj_button_export_clipboard.x = -abs(obj_button_export_clipboard.x)
}