/// @description create canvas surface

//create surface
canvas = surface_create(1024, 1024)
surface_set_target(canvas)
draw_clear_alpha(c_white, 0)


//draw sprite
if (sprite > -1) { //if there is a sprite to draw
	//draw the sprite with appropirate zoom and offset
	var _col = 0 //x modifier value
	var _row = 0 //y modifier value
	frame_width = obj_data.sprite_array[sprite, WIDTH]
	frame_height = obj_data.sprite_array[sprite, HEIGHT]
	for (var i = 0; i < obj_data.sprite_array[sprite, NUM]; i++) {
		draw_surface_part_ext(	
			obj_data.surface[obj_data.sprite_array[sprite, SURFACE]], 
			frame_width*i, 
			obj_data.sprite_array[sprite, YPOS], 
			frame_width, 
			frame_height, 
			_col*frame_width,
			_row*frame_height, 
			1, 1, c_white, 1 //draw modifiers
		)
		//store frame x and y
		if (frame =  i) {
			frame_x = _col*frame_width
			frame_y = _row*frame_height
		}
		//get place to draw next frame
		_col++ //move one space across
		if ((_col+1)*frame_width > surface_get_width(canvas)) { //if that space runs off the surface
			_col = 0 //move back to starting column
			_row++ //move down one row
		}
	}
}

surface_reset_target()

//centre sprite
x_off = (zoom*frame_width/2 - width/2  )/zoom
y_off = (zoom*frame_height/2 - height/2)/zoom