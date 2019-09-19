/// @description 
if ((image_blend = c_ltgray) or (image_blend = c_maroon)) {
	//draw mouseover text
	if (mouseover_text != "") {
		var _mx = mouse_x 
		if (_mx < camera_get_view_width(0)/2) {
			_mx += string_width(mouseover_text) + 6
		} else {
			_mx -= string_width(mouseover_text) + 6
		}
		draw_set_colour(c_black)
		draw_set_alpha(0.5)
		draw_rectangle(mouse_x, mouse_y - string_height(mouseover_text) - 4, _mx, mouse_y, false)	
		draw_set_colour(c_white)
		draw_set_alpha(1)
		draw_set_halign(fa_left)
		draw_set_valign(fa_bottom)
		draw_text(min(mouse_x, _mx) + 3, mouse_y - 2, mouseover_text)
	}
}