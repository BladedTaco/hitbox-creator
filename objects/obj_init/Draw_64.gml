/// @description draw surface
if !(surface_exists(surface[mode])) { //if surface missing
	event_user(2) //update surfaces
}
draw_surface(surface[mode], x, y)
