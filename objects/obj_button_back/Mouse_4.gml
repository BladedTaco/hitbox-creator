/// @description 
event_inherited();
with (obj_canvas) {
	frame = max(frame - 1, 0)
	event_user(1)
}
event_user(0)
