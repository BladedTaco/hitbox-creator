/// @description draw list
draw_self();
draw_set_colour(c_ltgray)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)

draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_colour(c_black)

for (var i = 0 ; i < 50; i++) {
	draw_text(x + 2*border, y + 65 +  i*16, obj_data.sprite_array[i + menu_index, NAME])
}