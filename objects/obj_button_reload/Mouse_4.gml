/// @description 
event_inherited();
if (show_question("Reload sprites, Are you sure?")) {
	with (obj_init) {
		event_user(1) //load new sprites
	}
	with (obj_list) {
		event_user(0) //repopulate sprite list	
	}
	with (obj_character_selector) {
		
	}
}