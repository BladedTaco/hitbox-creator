/// @description populate entry surface

//delete the existing surface if it exists
if (surface_exists(surf)) {
	surface_free(surf)	
}

//create new surface
surf = surface_create(256, 256)
surface_set_target(surf)
draw_clear_alpha(c_white, 1)

//draw the sprite

surface_reset_target();

