/// @description allow canvas to move again
if (obj_canvas.active) {
	if (selected and !keyboard_check(vk_control)) {
		selected = false;
		with (obj_hitbox_table) {
			event_perform(ev_other, ev_user2)
		}
	}

	obj_canvas.selected = true;
}