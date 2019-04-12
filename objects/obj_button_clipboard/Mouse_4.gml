/// @description 
event_inherited();
with (obj_hitbox_table) {
	if ((sprite > -1) and (frame > -1)) { //if there is a sprite selected
		if (obj_camera.y < 896) {
			obj_camera.y = 1344
		} else {
			obj_camera.y = 448
		}
	}
}