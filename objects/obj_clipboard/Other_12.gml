/// @description populate surface

if (surface_exists(surface)) {
	surface_set_target(surface)
	draw_text(50, 50, "HELOO")
	surface_reset_target()
}