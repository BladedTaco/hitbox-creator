/// @description 
event_inherited();

with(obj_hitbox_table) {
	if ((sprite > -1) and (frame > -1)) { //if there is a sprite selected
		caller = other.id
		caller_string = "Please select where to add the hitbox"
		caller_type = BETWEEN //single hitbox inbetween
		caller_sub_type = 1 //allow on no data
		event_user(3)	
	}
}