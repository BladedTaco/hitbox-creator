/// @description populate surface
//make sure the surface exists
if (!surface_exists(surface)) {
	surface = surface_create(512, 512)	
}

max_y = max(0, 3 + array_length_1d(name)*32 - height) //set the max y offset

//make sure the surface is large enough
while (surface_get_height(surface) < max_y + height) {
	surface_resize(surface, surface_get_width(surface), surface_get_height(surface)*2)	
}

surface_set_target(surface)
draw_clear(c_ltgray)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_colour(c_black)
for (var i = array_length_1d(name) - 1; i >= 0; i--) {
	draw_text(3, 3 + i*32, name[i]) 	
}


surface_reset_target()