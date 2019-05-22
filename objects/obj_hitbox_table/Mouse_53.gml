/// @description check for selection mode termination
if (!caller_started) { //callback wasnt started this click
	if (selection_mode and !active) { //clicking outside bounds in selection mode
		if (!point_in_rectangle(mouse_x, mouse_y, obj_canvas.x, obj_canvas.y, 
		obj_button_canvas_colour.x + obj_button_canvas_colour.sprite_width,
		obj_canvas.y + obj_canvas.height + obj_canvas.border)) {
			caller_data = [];
			event_user(3)
		}
	}
}
caller_started = false;