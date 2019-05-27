
/*

if (argument[0]) { //draw and create hitboxes
	
	draw_set_alpha(0.5) //set draw alpha to 1/2
	//define variables
	var _x, _y, _maj, _min, i, o, _mat, _dir, _xy, _array, col_hurt, col_hit, a
	_mat = matrix_build_identity()
	col_hurt = c_lime
	col_hit = c_blue

	//decide between drawing hitboxes or hurtboxes 
	repeat (2) { //repeat for hitbox and hurtbox
		switch (draw_get_colour()) { //check draw colour
			case col_hurt: //hurtboxes last drawn
				draw_set_colour(col_hit) //set draw colour for hitboxes
				_array = global.hitbox
			break;
		
			default: //hitboxes last drawn, or first run through
				draw_set_colour(col_hurt) //set draw colour for hurtboxes
				_array = global.hurtbox
			break;
		}

		with (obj_player) { //for each character
			i = sprite_index //get arrays first entry
			if (sprite_exists(i)) { //if there is a sprite to draw hitboxes for
				o = floor(image_index)*100 //get arrays second entry
				while (_array[i, o] != NULL) { //for every hitbox
					//get parameters
					_maj = image_xscale*_array[i, o + 1]/2
					_min = image_yscale*_array[i, o + 2]/2
					_x = image_xscale*_array[i, o + 3]
					_y = image_yscale*_array[i, o + 4]
					_dir = -sign(image_xscale)*_array[i, o + 5] - image_angle
					
					if (image_angle != 0) {
						var _d = degtorad(-image_angle)
						_xy = _x
						_x = _xy*cos(_d) - _y*sin(_d) + x//rotate around origin and translate
						_y = _xy*sin(_d) + _y*cos(_d) + y//rotate around origin and translate
					} else {
						_x += x
						_y += y
					}
					
					//create the hurtbox
					if (_array = global.hitbox) {
						//get the knocback direction
						a = _array[i, o + 7]
						if (a <= 360) { //if angle is an absolute direction
							if (image_xscale < 0) { 
							 a = 180 - a //flip angle horizontally if facing left
							}
							a = (a + image_angle + 360) mod 360 //change angle by facing direction
						}
						
						//check for a grab hitbox and if so, move to grabbed
						if ((obj_match_handler.state[player_number] = HOLDING) and (instance_exists(attacker))) {
							_x = attacker.x
							_y = attacker.y
						}
						
						scr_check_collision(_array[i, o], _maj, _min, _x, _y, _dir, 
						_array[i, o + 6], a, _array[i, o + 8], 
						_array[i, o + 9], _array[i, o + 10]) //create the hitbox
					} else {
						scr_check_collision(_array[i, o], _maj, _min, _x, _y, _dir) //create the hurtbox
					}
				
					switch (_dir) { //rotate world matrix if needed
						case 0:	break; //do nothing for 0
				
						case DIR: //set _dir to image_angle
							_dir = image_angle
						default: //rotate world matrix by _dir on z-axis
							_mat = matrix_build(0, 0, 0, 0, 0, -_dir, 1, 1, 1) //build rotated matrix
							matrix_set(matrix_world, _mat) //set the world matrix to the built one
							_dir = degtorad(-_dir) //set _dir to its radian counterpart
							_xy = _x //used to replace _x as it gets changed too early
							_x = (_xy)*cos(_dir) - (_y)*sin(_dir) //translate x coordinate
							_y = (_xy)*sin(_dir) + (_y)*cos(_dir) //translate y coordinate
						break;		
					}
		
					switch (_array[i, o]) { //check hitbox shape and draw hitbox
						case CIRCLE: //draw hitbox as circle/ellipse
							draw_ellipse(_x - _maj, _y - _min, _x + _maj, _y + _min, false)
						break;
		
						case RECTANGLE: //draw hitbox as square/rectangle
							draw_rectangle(_x - _maj, _y - _min, _x + _maj, _y + _min, false)
						break;
					}
		
					if (_mat != matrix_build_identity()) { //if world matrix has been rotated
						_mat = matrix_build_identity() //build identity matrix
						matrix_set(matrix_world, _mat) //set the world matrix to identity
					}
					o += 11 //increment o to check for multiple hitboxes on a single frame
				}
				o = floor(image_index)*100 //reset o to redo loop for hitboxes
			}
		}
	}
	draw_set_alpha(1) //reset draw alpha

}