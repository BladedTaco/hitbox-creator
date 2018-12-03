/// @description Load in sprites
//create surface and sprite
surface = surface_create(2048, 2048)
surface_set_target(surface)
draw_clear_alpha(c_white, 0)
surface_reset_target()
sprite = sprite_create_from_surface(surface, 0, 0, 1, 1, true, false, 0, 0)
sprite_y = 0
sprite_num = 0
sprite_array = [] // NAME | YPOS | NUM | WIDTH | HEIGHT | X_OFF | Y_OFF 



if (scr_read_sprite("spr_bal_aerial_back")) {
	show_debug_message("SUCCESS")
} else {
	show_debug_message("FAILURE")	
}

show_debug_message(sprite_array)