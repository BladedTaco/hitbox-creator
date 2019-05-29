/// @description draw htibox


var z = obj_canvas.zoom
if (z != zoom) {
	zoom = 1
	x_off = 0
	y_off = 0
	if (z != zoom) {
		//off is - diff from being centred*value
		//x_off = -(z-1)*(start_x - start_width/2) 
		//y_off = -(z-1)*(start_y - start_height/2)  
		
		//move to centre (note this is not centre and it changes based on width and start x
		var _w, _h;
		_w = (start_x + start_width/2) 
		_h = (start_y + start_height/2) 
		x_off = -_w
		y_off = -_h
		
		//move to actual position
		
		
		
		
		//do {
		//	//change offset based on triangular numbers sequence
		//	x_off -= _w*1/(zoom*(zoom+1))
		//	y_off -= _h*1/(zoom*(zoom+1))
		//	zoom += 1
		//} until (zoom = z)
	}
}

x = start_x + start_width*z + obj_canvas.x - obj_canvas.x_off*z + x_off
y = start_y + start_height*z + obj_canvas.y - obj_canvas.y_off*z + y_off
image_xscale = start_width*z
image_yscale = start_height*z


//set clipping mask shader
shader_set(shd_clip)
var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
shader_set_uniform_f(u_bounds, bounds[0], bounds[1], bounds[2], bounds[3]);

draw_set_alpha(0.3)
draw_set_colour(c_aqua)
draw_rectangle(x, y, x + image_xscale, y + image_yscale, false)
draw_set_alpha(1)

shader_reset();