/// @description create canvas surface

//create surface
canvas = surface_create(1024, 1024)
surface_set_target(canvas)
draw_clear_alpha(c_ltgray, 1)


//draw sprite
if (sprite > -1) { //if there is a sprite to draw
	//draw the sprite with appropirate zoom and offset
	draw_surface_part_ext(	
		obj_data.surface[obj_data.sprite_array[sprite, SURFACE]], 
		obj_data.sprite_array[sprite, WIDTH]*frame, 
		obj_data.sprite_array[sprite, YPOS], 
		obj_data.sprite_array[sprite, WIDTH], 
		obj_data.sprite_array[sprite, HEIGHT], 
		(image_xscale - zoom*obj_data.sprite_array[sprite, WIDTH])/2,
		(image_yscale - zoom*obj_data.sprite_array[sprite, HEIGHT])/2, 
		zoom, zoom, c_white, 1 //draw modifiers
	)
}

surface_reset_target()
