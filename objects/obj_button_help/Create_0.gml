/// @description 
event_inherited();
mouseover_text = "See controls"

//set objects
object_list = [obj_canvas, obj_hitbox_table, obj_clipboard, obj_list]

//get object positions for easier shorthand
var o_pos = []
for (var i = array_length_1d(object_list) - 1; i >= 0; i--) {
	o_pos[i*2 + 1] = object_list[i].y + object_list[i].border //ypos
	o_pos[i*2] = object_list[i].x + object_list[i].border + 2 //xpos
}

//set text positions and data
//init text array and length
text_array = []
text_array[32, 2] = "" //TODO change this to the amount of entries
text_length = 0

//add each entry
//canvas controls
scr_add_help_text(o_pos[0], o_pos[1],			"MIDDLE CLICK & DRAG - Pan around canvas")
scr_add_help_text(o_pos[0], o_pos[1] + 26,		"SCROLL UP - Zoom in")
scr_add_help_text(o_pos[0], o_pos[1] + 26*2,	"SCROLL DOWN - Zoom out")
scr_add_help_text(o_pos[0], o_pos[1] + 26*3,	"RIGHT CLICK - Centre sprite")
scr_add_help_text(o_pos[0], o_pos[1] + 26*4,	"RIGHT CLICK & SHIFT - Centre sprite origin")
scr_add_help_text(o_pos[0], o_pos[1] + 26*5,	"LEFT CLICK - Interact with hitboxes")
scr_add_help_text(o_pos[0], o_pos[1] + 26*6,	"CONTROL: HOLD - Multi-hitbox select mode, disables hitbox resizing and rotating")
scr_add_help_text(o_pos[0], o_pos[1] + 26*7,	"SHIFT + L-CLICK: ON HITBOX CENTER - Rotate hitbox")
scr_add_help_text(o_pos[0], o_pos[1] + 26*8,	"SHIFT + L-CLICK: ON HITBOX EDGE - 1D hibox resizing")
scr_add_help_text(o_pos[0], o_pos[1] + 26*9,	"SHIFT + L-CLICK: ON HITBOX CORNER - 2D hitbox resizing")

//hitbox table controls
scr_add_help_text(o_pos[2], o_pos[3],			"LEFT CLICK - Edit entry")
scr_add_help_text(o_pos[2], o_pos[3] + 26,		"SCROLL UP - Move entries down")
scr_add_help_text(o_pos[2], o_pos[3] + 26*2,	"SCROLL DOWN - Move entries up")
scr_add_help_text(o_pos[2], o_pos[3] + 26*3,	"SHIFT + SCROLL UP - Increment entry value")
scr_add_help_text(o_pos[2], o_pos[3] + 26*4,	"SHIFT + SCROLL DOWN - Decrement entry value")
scr_add_help_text(o_pos[2], o_pos[3] + 26*5,	"RED TEXT - Negative value")

//clipboard controls
scr_add_help_text(o_pos[4], o_pos[5],			"LEFT CLICK: ON ENTRY - Add to table")
scr_add_help_text(o_pos[4], o_pos[5] + 26,		"LEFT CLICK: ON DESCRIPTION - Change desc")
scr_add_help_text(o_pos[4], o_pos[5] + 26*2,	"RIGHT CLICK - Remove entry")
scr_add_help_text(o_pos[4], o_pos[5] + 26*3,	"SCROLL UP - Move entries down")
scr_add_help_text(o_pos[4], o_pos[5] + 26*4,	"SCROLL DOWN - Move entries up")

//list controls
scr_add_help_text(o_pos[6], o_pos[7],			"LEFT CLICK: ON ICON")
scr_add_help_text(o_pos[6], o_pos[7] + 26,		"  - Select character")
scr_add_help_text(o_pos[6], o_pos[7] + 26*2,	"L-DRAG: ON ICON BAR")
scr_add_help_text(o_pos[6], o_pos[7] + 26*3,	"  - Move icons")
scr_add_help_text(o_pos[6], o_pos[7] + 26*4,	"LEFT CLICK: ON NAME")
scr_add_help_text(o_pos[6], o_pos[7] + 26*5,	"  - Select animation")
scr_add_help_text(o_pos[6], o_pos[7] + 26*6,	"SCROLL UP")
scr_add_help_text(o_pos[6], o_pos[7] + 26*7,	"  - Move entries down")
scr_add_help_text(o_pos[6], o_pos[7] + 26*8,	"SCROLL DOWN")
scr_add_help_text(o_pos[6], o_pos[7] + 26*9,	"  - Move entries up")