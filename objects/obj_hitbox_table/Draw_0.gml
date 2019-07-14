/// @description draw canvas
draw_self();
draw_set_colour(c_white)
draw_rectangle(x + border, y + border, x + width - 1, y + height - 1, false)
draw_text_colour(x + width/2 - 95, y + height/2, "Please select a sprite", c_aqua, c_lime, c_fuchsia, c_maroon, 1)

if ((sprite > -1) and (frame > -1)) {
	if !(surface_exists(surface)) {
		surface = surface_create(1024, 512)
		event_user(2)
	}
	
	if (frame != obj_canvas.frame) {
		frame = obj_canvas.frame
		event_user(2)
	}

	surface_set_target(surface)
	//ADD ANY SPECIAL PER FRAME DRAWS IN HERE
	//ADD ANY SPECIAL PER FRAME DRAWS IN HERE
	surface_reset_target()

	//set clipping mask shader
	shader_set(shd_clip)
	var u_bounds = shader_get_uniform(shd_clip, "u_bounds")
	shader_set_uniform_f(u_bounds, x + border, y + border, x + width, y + height);

	draw_surface(surface, x, y - y_off[frame])	

	shader_reset() //reset the shader

	if (active and hitbox) {
		draw_set_colour(c_aqua)
		draw_set_alpha(0.4)
		
		var _mx = mouse_x - x
		var _my = mouse_y - y
		var _table = table_list[frame]
		_mx = clamp(floor(_mx/32), 0, 26) //get x index
		_my = floor((_my + y_off[frame])/23) - 1 //get y index
		if ((_my = -1) or (_my = hurtbox[frame])) { //on a description
			if (!selection_mode) {
				_my += 1 - y_off[frame]/23

				draw_rectangle(
					max(x + _mx*32, x),
					max(y + _my*23, y),
					min(x + (_mx+1)*32, x + width),
					min(y + (_my+1)*23, y + height),
					false
				)

				_my -= 1 - y_off[frame]/23
			}
		} else if ((_my < array_height_2d(_table))) { //on a hitbox
			if !(selection_mode and (caller_type == BETWEEN)) {
				if ((_my < hurtbox[frame]) or (_my > hurtbox[frame])) {
					_my += 1 - y_off[frame]/23
				
					draw_rectangle(
						x,
						max(y + _my*23 + 1, y),
						x + width,
						min(y + (_my+1)*23 - 1, y + height),
						false
					)
				
					_my -= 1 - y_off[frame]/23
					obj_canvas.hitboxes[_my - (_my >= hurtbox[frame])].glow = true;
				}
			}
		}
		draw_set_colour(c_white)
		draw_set_alpha(1)
	}
}
