/// @description create canvas surface

//create surface
canvas = surface_create(1024, 1024)
surface_set_target(canvas)
draw_clear_alpha(c_white, 0)

//draw border
draw_set_colour(c_black)
var _width = 8 //half the width of the line
//draw the border
draw_line_width(0, 0, 1024, 0, _width)
draw_line_width(1024, 0, 1024, 1024, _width)
draw_line_width(1024, 1024, 0, 1024, _width)
draw_line_width(0, 1024, 0, 0, _width)

//draw sprite
if (sprite > -1) { //if there is a sprite to draw
	//draw the sprite with appropirate zoom and offset
	draw_surface_part_ext(	
		obj_data.sprite_array[sprite, SURFACE], 
		obj_data.sprite_array[sprite, WIDTH]*frame, 
		obj_data.sprite_array[sprite, YPOS], 
		obj_data.sprite_array[sprite, WIDTH], 
		obj_data.sprite_array[sprite, HEIGHT], 
		512 + x_off,
		512 + y_off, 
		zoom, zoom, c_white, 1 //draw modifiers
	)
}

surface_reset_target()
