/// @description handle backup progress
event_inherited();

draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if (backup_result != 0) {
	if (backup_result > 0) {
		backup_result--	
		draw_set_alpha(2*backup_result/room_speed/5)
		draw_text(room_width/2, 100, "Backup File successfully saved!")
	} else {
		backup_result++
		draw_set_alpha(2*backup_result/room_speed/5)
		draw_text(room_width/2, 100, "Backup File failed to save ;(")
	}
}


draw_set_alpha(1)
