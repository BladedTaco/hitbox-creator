/// @description allow canvas to move again
if (obj_canvas.active) {
	if (selected and !keyboard_check(vk_control)) {
		resizing = false;
		rotating = false;
		selected = false;
		side = [0, 0];
		with (obj_hitbox_table) {
			event_perform(ev_other, ev_user2)
		}
	}

	obj_canvas.selected = true;
}