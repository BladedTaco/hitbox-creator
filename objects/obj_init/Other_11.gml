/// @description Load in sprites
if (scr_read_sprite("spr_bal_aerial_back")) {
	show_debug_message("SUCCESS")
} else {
	show_debug_message("FAILURE")	
}
game_end()	