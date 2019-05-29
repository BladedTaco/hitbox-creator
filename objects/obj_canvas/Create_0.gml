/// @description init variables

//variable init
canvas = -1
sprite = -1
frame = -1
zoom = 5
x_off = 0
y_off = 0
border = 4
width = image_xscale - border
height = image_yscale - border
active = false
frame_x = 0
frame_y = 0
frame_width = 0
frame_height = 0
canvas_colour = c_red
rainbow_mode = false
selected = true;

frame = 2
sprite = 0

event_user(0) //create canvas

for (var i = 0; i < 33; i++) {
	with (instance_create_depth(x + image_xscale, y + i*16, 0, obj_button_canvas_colour)) {
		colour = make_colour_hsv(3*(i div 3)*256/34, 256 - (i mod 3)*64, 256 - (i mod 3)*64)	
	}
}
with (instance_create_depth(x + image_xscale, y + 33*16, 0, obj_button_canvas_colour)) {
	colour = make_colour_hsv(128, 76, 76)
}