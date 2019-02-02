/// @description handle press
if (obj_character_selector.active) {
	event_inherited();
	with (obj_list) {
		character = other.character
		event_user(0)
	}
}