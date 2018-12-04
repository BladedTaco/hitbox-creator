/// @description 
draw_set_halign(fa_right)
draw_set_colour(c_white)
for (var i = 0; i < 9; i++) {
	draw_text(-10 + x, i*1000 + y, string(i*1000))
	draw_line_width_colour(-50 + x, i*1000 + y, -10, 300, 2, c_white, c_aqua)
	draw_line_width_colour(x, y + 1000*i, x + 8192, y + 1000*i, 2, c_aqua, c_white)
	draw_line_width_colour(x + 1000*i, y, x + 1000*i, y + 8192, 2, c_aqua, c_white)
} 
var _num
for (i = 0; i < sprite_num; i++) {
	if (sprite_array[i, 7] = mode) { //for each sprite on the surface
		_num = image mod sprite_array[i, 2] 
		draw_surface_part(surface[mode], sprite_array[i, 3]*_num, sprite_array[i, 1], sprite_array[i, 3], sprite_array[i, 4], x -sprite_array[i, 3], y + sprite_array[i, 1])
	}
}
image++
