/// @description 
//create surface and sprite
surface = []
surface_width = 0
buffer = []
sprite_y = 0
sprite_num = 0
sprite_array = [] // NAME | YPOS | NUM | WIDTH | HEIGHT | X_OFF | Y_OFF | SURFACE
mode = 0
image = 0
sprite = sprite_create_from_surface(application_surface, 0, 0, 1, 1, true, false, 0, 0)

//ask whether to reload sprite sheets, or use saved sheets
if (show_question("RELOAD SPRITE SHEETS?")) {
	event_user(1) //load new sprites
} else {
	event_user(2) //load old sprite sheets
}

event_user(4) //create surface buffers
