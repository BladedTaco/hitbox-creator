/// @description draw htibox
if (visible) {
	x += obj_canvas.x + obj_canvas.frame_x
	y += obj_canvas.y + obj_canvas.frame_y
	draw_set_alpha(0.3)
	draw_set_colour(c_aqua)
	draw_rectangle(x, y, x + image_xscale, y + image_xscale, false)
	draw_set_alpha(1)
	x -= obj_canvas.x + obj_canvas.frame_x
	y -= obj_canvas.y + obj_canvas.frame_y
}