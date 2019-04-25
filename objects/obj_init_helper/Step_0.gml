/// @description be useful then kill self

//load in the initial hitbox data when software launches and destroy self
with (obj_list) {
	event_perform(ev_mouse, ev_left_press)
}
instance_destroy();
