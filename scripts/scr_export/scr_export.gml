//make exporting happen over multiple steps so a progress bar can be added e.g. check after each sprite if delta_time > 250 or something


switch (argument[0]) { //type
	case 0: //START
		//set exporting flag
		exporting = true;
		
		//deactivate unneeded objects
		instance_deactivate_all(true);
		instance_activate_object(obj_data);
		
		//set starting variables
		sprite = -1;
		frame = -1;
		hitbox = -1;
		time = current_time;
		hurtbox_string = ""
		hitbox_string = ""
		hitbox = false;
	break;
	
	case 1: //STEP
		
		time = current_time //get time in milliseconds
		hitbox = false;
		var _str = ""
		var i = 0
		var _list = obj_data.hitbox_list[obj_data.sprite_array[sprite, SURFACE]]
		var f_num, data, h;
		
		
		while (current_time - time < 200) { //while less than 1/5 of a second spent in this script
			//write one sprite into the string
			i = 0
			repeat(2) { //once for hitboxes, once for hurtboxes
				if (hitbox) {
					_list = obj_data.hitbox_list[obj_data.sprite_array[sprite, SURFACE]]	
				} else { //hurtbox
					_list = obj_data.hurtbox_list[obj_data.sprite_array[sprite, SURFACE]]	
				}
				/*
				for the sprite
				 if data, write: sprite_name\n{\n
					for each frame
					 if data, write: frame\nframe_number\n{\n
						for each hitbox
						 if data, write: hitbox\nhitbox_number\n{\n
							for each data point
							 write: value\n
						 write: }\n
					 write: }\n
				 write: }\n
				repeat for hitboxes
				*/
				
				//check for data in sprite
				
				//check the first entry of the first hitbox of each frame for data
				data = false;
				f_num = obj_data.sprite_array[sprite, NUM]
				for (f_num = obj_data.sprite_array[sprite, NUM] - 1; f_num >= 0; f_num--) {
					if (_list[(sprite - _list[0, 0])*10 + f_num, 0] != -10) {
						data = true;
						break;
					}
				}
				
				if (data) { //data found
					//write sprite name
					_str = obj_data.sprite_array[sprite, NAME] + "\n{\n"
					f_num = obj_data.sprite_array[sprite, NUM]
					frame = 0
					repeat (f_num) { //for each frame
						//if the first hitbox has data
						if (_list[(sprite - _list[0, 0])*10 + frame, 0] != -10) {
							//write frame info
							_str += "frame\n" + string(frame) + "\n{\n"
							//for each hitbox, if it has data in the first entry
							while (_list[(sprite - _list[0, 0])*10 + frame, 25*hitbox] != -10) {
								//write hitbox info
								_str += "hitbox\n" + string(hitbox) + "\n{\n"
								//write data
								for (h = 0; h < 25; h++) { //for each data point
									//add the data point to the string
									_str += string(_list[(sprite - _list[0, 0])*10 + frame, 25*hitbox + h]) + "\n"
								}
								_str += "}\n"
								hitbox++
							}
							_str += "}\n"
						}
						frame++
					}
					_str += "}\n"
				
					if (hitbox) {
						hitbox_string += _str	
					} else {
						hurtbox_string += _str
					}
					_str = ""
					hitbox = true;
				}
			}
			sprite++
			if (sprite >= obj_data.sprite_num) { //all sprites done
				//take away the final \n's
				hitbox_string = string_delete(hitbox_string, string_length(hitbox_string), 1)
				hurtbox_string = string_delete(hurtbox_string, string_length(hurtbox_string), 1)
				return true //return its finished
			}
		}
	break;
	
	case 2: //DRAW
		draw_set_alpha(1)
		draw_set_colour(c_white)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_healthbar(200, 300, 1400, 596, (sprite/obj_data.sprite_num)*100, c_black, c_red, c_aqua, 0, true, true)
		var _str = "Exporting Hitboxes."
		repeat (draw_state) {
			_str = string_replace(_str, ".", "..")
		}
		draw_state++
		if (draw_state >= 3) {
			draw_state = 0;	
		}
		draw_text(800, 448, _str)
	break;
	
	case 3: //FINISH
		var _file = file_text_open_write("Hitboxes.txt")
		file_text_write_string(_file, hitbox_string)
		file_text_close(_file);
		
		_file = file_text_open_write("Hurtboxes.txt")
		file_text_write_string(_file, hurtbox_string)
		file_text_close(_file);
		
		instance_activate_all();
		exporting = false;
	break;
	
	default: 
	break;
}
return false;