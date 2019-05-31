/// @description 
event_inherited();
mouseover_text = "See controls"

//set objects
object_list = [obj_canvas, obj_hitbox_table, obj_clipboard, obj_list]

//get object positions for easier shorthand
var o_pos = []
for (var i = array_length_1d(object_list) - 1; i >= 0; i--) {
	o_pos[i*2 + 1] = object_list[i].y + object_list[i].border
	o_pos[i*2] = object_list[i].x + object_list[i].border
}

//set text positions and data
//init text array and length
text_array = []
text_array[99, 2] = "" //change this to the amount of entries
text_length = 0

//add each entry
scr_add_help_text(o_pos[0], o_pos[1], "MIDDLE CLICK & DRAG - Pan around canvas")
scr_add_help_text(o_pos[0], o_pos[1] + 26, "SCROLL UP - Zoom in")
scr_add_help_text(o_pos[0], o_pos[1] + 26*2, "SCROLL DOWN - Zoom out")
scr_add_help_text(o_pos[0], o_pos[1] + 26*3, "RIGHT CLICK - Centre sprite")
scr_add_help_text(o_pos[0], o_pos[1] + 26*4, "LEFT CLICK - Interact with hitboxes")
scr_add_help_text(o_pos[0], o_pos[1] + 26*5, "CONTROL CLICK - Select Multiple Hitboxes")
scr_add_help_text(o_pos[0], o_pos[1], "")
scr_add_help_text(o_pos[0], o_pos[1], "")
