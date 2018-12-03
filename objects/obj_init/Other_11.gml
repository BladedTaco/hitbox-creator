/// @description Load in sprites
//create surface and sprite
surface = surface_create(8192, 8192)
surface_set_target(surface)
draw_clear_alpha(c_white, 0.1)
surface_reset_target()
sprite = sprite_create_from_surface(surface, 0, 0, 1, 1, true, false, 0, 0)
sprite_y = 0
sprite_num = 0
sprite_array = [] // NAME | YPOS | NUM | WIDTH | HEIGHT | X_OFF | Y_OFF 
//copy the directory
directory_copy_fmns("C:\\Users\\v2tac\\Desktop\\The catalyst\\Atavistic Sanctum\\Atavistic Sanctum\\sprites\\", working_directory + "SPRITES\\")

var _file = file_find_first(working_directory + "SPRITES\\spr_bal*", fa_directory) //find the first balloony sprite
while (_file != "") {
	if (scr_read_sprite(_file)) {
		show_debug_message("SUCCESS")
	} else {
		show_debug_message("FAILURE")	
	}
	_file = file_find_next()
}
file_find_close()

show_debug_message(sprite_array)