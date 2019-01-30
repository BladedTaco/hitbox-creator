/// @description 
event_inherited();
with (obj_canvas) {
	frame = min(frame + 1, obj_data.sprite_array[sprite, NUM] - 1)
	event_user(1)
}
event_user(0)