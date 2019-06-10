/// @description populate entry surface

//delete the existing surface if it exists
if (surface_exists(surf)) {
	surface_free(surf)	
}

//create new surface
surf = surface_create(1024, 1024)
surface_set_target(surf)
draw_clear_alpha(c_dkgray, 1)

//set and get variables
var z = 3 //zoom

//set vars
var _x, _y, _maj, _min, _rot, _pos, _bounds;
_maj = obj_data.sprite_array[sprite[selected], WIDTH]
_min = obj_data.sprite_array[sprite[selected], HEIGHT]
_bounds = [0, 0, _maj*z, _min*z]
_pos = [];

//get boundaries of hitboxes
for (var i = 0; i < array_length_2d(data, selected)/25; i++) { //for each hitbox
	//get the corner positions of the hitbox rectangles
	_maj = data[selected, i*25 + 1]/2
	_min = data[selected, i*25 + 2]/2
	_x = data[selected, i*25 + 3]
	_y = data[selected, i*25 + 4]
	_rot = data[selected, i*25 + 6]
	
	for (var o = 0; o < 4; o++) { //for each corner
		//get corner position
		_pos = [];
		_pos = scr_get_rotated_position(_maj*sign(o - 1.5), _min*sign((o mod 1.8) - 0.9), _rot)
		_pos[0] += _x + obj_data.sprite_array[sprite[selected], X_OFF]
		_pos[1] += _y + obj_data.sprite_array[sprite[selected], Y_OFF]
	
		//update bounds
		_bounds[0] = min(_bounds[0], _pos[0]*z)
		_bounds[1] = min(_bounds[1], _pos[1]*z)
		_bounds[2] = max(_bounds[2], _pos[0]*z)
		_bounds[3] = max(_bounds[3], _pos[1]*z)
	}
}

show_debug_message(_bounds)

//set the dimensions
frame_width = (_bounds[2] - _bounds[0])
frame_height = (_bounds[3] - _bounds[1])

//draw the base sprite
draw_surface_part_ext(
	obj_data.surface[obj_data.sprite_array[sprite[selected], SURFACE]],
	obj_data.sprite_array[sprite[selected], WIDTH]*frame[selected],
	obj_data.sprite_array[sprite[selected], YPOS],
	obj_data.sprite_array[sprite[selected], WIDTH],
	obj_data.sprite_array[sprite[selected], HEIGHT],
	-_bounds[0], -_bounds[1], z, z, c_white, 1
)

//draw the hitboxes
draw_set_alpha(0.35)
draw_set_colour(HITBOX_COL_.HITBOX)
for (var i = 0; i < array_length_2d(data, selected)/25; i++) { //for each hitbox
	//starting to draw hurtboxes
	if (i >= hitbox[selected]) {
		draw_set_colour(HITBOX_COL_.HURTBOX)	
	}
	
	//draw the hitbox
	scr_draw_shape(
		data[selected, i*25],
		data[selected, i*25 + 3]*z + obj_data.sprite_array[sprite[selected], X_OFF]*z - _bounds[0],
		data[selected, i*25 + 4]*z + obj_data.sprite_array[sprite[selected], Y_OFF]*z - _bounds[1],
		data[selected, i*25 + 1]*z,
		data[selected, i*25 + 2]*z,
		data[selected, i*25 + 6],
		5
	)
}
draw_set_alpha(1)

surface_reset_target();

