/// @description 
with (obj_canvas) {
	frame = (frame + 1) mod obj_data.sprite_array[sprite, NUM]
	event_user(1)
}