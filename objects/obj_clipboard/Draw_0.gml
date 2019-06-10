/// @description draw canvas
draw_self();
draw_set_colour(c_white)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)

if !(surface_exists(surface)) {
	surface = surface_create(512, 512)
	event_user(2)
}

//set clipping mask shader
shader_set(shd_clip)
var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
shader_set_uniform_f(u_bounds, x + border, y + border, x + width, y + height);

draw_surface(surface, x, y - y_off)	

if (active) {
	var _my = floor(2*(mouse_y - y - border + y_off)/separation) //the index
	var _dy = floor(2*(mouse_y - y - border)/separation) //the draw location
	if (_my/2 < array_length_1d(name)) {

		if (_my mod 2 = 0) { //given name and data
			draw_set_alpha(0.4)
			draw_set_colour(c_aqua)
			draw_rectangle(x, y + _dy*separation/2, x + width, y + (_dy+2)*separation/2, false)
		} else { //description
			draw_set_alpha(0.3)
			draw_set_colour(c_aqua)
			draw_rectangle(x, y + (_dy-1)*separation/2, x + width, y + (_dy+1)*separation/2, false)
			draw_set_colour(c_lime)
			draw_rectangle(x + separation, y + _dy*separation/2, x + width, y + (_dy+1)*separation/2, false)
		}	
		draw_set_alpha(1)
	}
}
	
shader_reset() //reset the shader

draw_set_colour(c_black)

if (active) { //for entry visual
	if ((_my/2 < array_length_1d(name)) and (_my >= 0)) { //selecting an entry
		if ((floor(_my/2) = selected) and surface_exists(surf)) {
			//draw surface with clipping
			
			//get boundaries
			var _bounds = [];
			_bounds[0] = x + border + width
			_bounds[1] = y + (_dy + 2)*separation/2 - frame_height
			_bounds[2] = _bounds[0] + frame_width
			_bounds[3] = _bounds[1] + frame_height
			
			if (_my mod 2 = 1) { //change y bounds
				_bounds[1] = y + (_dy+1)*separation/2 - frame_height
				_bounds[3] = _bounds[1] + frame_height
			}
			
			draw_set_colour(c_dkgray)
			draw_rectangle(_bounds[0], _bounds[1], _bounds[2], _bounds[3], false)
			//set clipping mask shader
			shader_set(shd_clip)
			var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
			shader_set_uniform_f_array(u_bounds, _bounds);

			draw_surface(surf, _bounds[0], _bounds[1])
			
			shader_reset();
		} else { //new entry or no surface
			//create surface
			selected = floor(_my/2)
			event_user(3)
		}
	}
}