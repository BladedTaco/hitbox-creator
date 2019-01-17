/// @description recreate all surfaces if needed
if (!surface_exists(obj_data.surface[obj_data.mode])) { //if current surface doesnt exist
	event_user(0)	
}
with (obj_canvas) {
	if (!surface_exists(canvas)) { //if there is no canvas
		event_user(0) //recreate canvas
	}
}