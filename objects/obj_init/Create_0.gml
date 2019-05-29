/// @description init
macros();
//create surface and sprite
surface = []
surface_width = 0
buffer = []
sprite_y = 0
sprite_num = 0
frame_max = 0
sprite_array = [] // NAME | YPOS | NUM | WIDTH | HEIGHT | X_OFF | Y_OFF | SURFACE | REAL NUMBER
hitbox_list = [] //array reference for each character
hurtbox_list = [] //array reference for each character
sprite_list = [] // id list of sprites
mode = 0
image = 0
sprite = sprite_create_from_surface(application_surface, 0, 0, 1, 1, true, false, 0, 0)

//try to load old sprite sheets
event_user(2) //load old sprite sheets

//get hitboxes and hand off to data object
event_user(4)