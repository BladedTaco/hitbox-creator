/// @description create surfaces

for (var i = 0; true; i++) { //for as long as it takes
	var _file = "Surfaces\\Surface_" + string(i) //get the surface file
	if (file_exists(_file)) { //check if the file exists
		//create and populate the surface
		sprite_replace(sprite, _file, 1, false, false, 0, 0)
		surface[i] = surface_create(sprite_get_width(sprite), sprite_get_height(sprite))
		surface_set_target(surface[i])
		draw_sprite(sprite, 0, 0, 0)
		surface_reset_target()
	} else { //no more surfaces
		break; //break the loop
	}
}

//hand off data to data object
event_user(3)