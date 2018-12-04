/// @description 
//create surface and sprite
surface = []
sprite_y = 0
sprite_num = 0
sprite_array = [] // NAME | YPOS | NUM | WIDTH | HEIGHT | X_OFF | Y_OFF 
mode = 0
image = 0
sprite = sprite_create_from_surface(application_surface, 0, 0, 1, 1, true, false, 0, 0)

if (show_question("RELOAD SPRITE SHEETS?")) {
	event_user(0) //create objects
	event_user(1) //load new sprites
} else {
	event_user(2) //load old sprite sheets
}