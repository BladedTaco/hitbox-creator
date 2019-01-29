/// @description 
draw_self();
draw_set_colour(c_ltgray)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)

//set clipping mask shader
shader_set(shd_clip)
var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
shader_set_uniform_f(u_bounds, x + border, y + border, x + width, y + height);

var _x = x + border - x_off*zoom
var _y = y + border - y_off*zoom
draw_surface_part_ext(canvas, frame_x, frame_y, frame_width, frame_height, _x, _y, zoom, zoom, c_white, 1)

shader_reset() //reset the shader