/// @description draw canvas
draw_self();
if (rainbow_mode) {
	canvas_colour = make_colour_hsv((colour_get_hue(canvas_colour) + 1) mod 256, colour_get_saturation(canvas_colour), colour_get_value(canvas_colour))
}
draw_set_colour(canvas_colour)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)

//set clipping mask shader
shader_set(shd_clip)
var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
shader_set_uniform_f(u_bounds, x + border, y + border, x + width, y + height);

var _pos = [x + border - x_off*zoom, y + border - y_off*zoom]

draw_surface_part_ext(canvas, frame_x, frame_y, frame_width, frame_height, _pos[0], _pos[1], zoom, zoom, c_white, 1)


shader_reset() //reset the shader

with (obj_hitbox) {
	event_perform(ev_draw, 0)
}	

//set new clipping mask shader
shader_set(shd_clip_no_tex)
var u_bounds = shader_get_uniform(shd_clip_no_tex, "u_bounds")
shader_set_uniform_f(u_bounds, x + border, y + border, x + width, y + height);

draw_set_alpha(0.6)
//draw a circle at sprite origin
draw_set_colour(c_lime)
sprite_origin_pos = [_pos[0] + frame_off_x*zoom + zoom/2, _pos[1] + frame_off_y*zoom + zoom/2]
draw_circle(sprite_origin_pos[0], sprite_origin_pos[1], 2 + zoom/4, false)

shader_reset() //reset the shader


//draw a circle at centre of canvas
draw_set_colour(c_navy)
draw_circle(x + border + width/2,  y + border + height/2, 3, false)
draw_set_alpha(1)

draw_healthbar(x + 1, y + height + 8, x + width + 2, y + height + 12, (frame/(obj_data.sprite_array[sprite, NUM]-1))*100,
	c_black, c_aqua, c_aqua, 0, true, true)