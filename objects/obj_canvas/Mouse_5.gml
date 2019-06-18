/// @description centre sprite

if (keyboard_check(vk_shift)) { //centre on origin
	x_off = (zoom*frame_off_x - width/2  )/zoom + 0.5
	y_off = (zoom*frame_off_y - height/2)/zoom	+ 0.5
} else { //centre sprite
	x_off = (zoom*frame_width/2 - width/2  )/zoom
	y_off = (zoom*frame_height/2 - height/2)/zoom
}