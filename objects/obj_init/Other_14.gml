/// @description get hitboxes

var _str = "" 
var _file = "" //file
var i, o, j, k, _hitbox; //sprite number, frame number, hitbox number, data point number, loop index

//set null value array
for (i = sprite_num*10; i >= 0; i--) {
	for (o = frame_max*25; o>= 0; o--) {
		hurtbox[i, o] = -10
		hitbox[i, o] = -10
	}
}

repeat (2) { //once for hitboxes, once hurtboxes
	if (_hitbox) { //hitboxes
		_file = file_text_open_read("Hitboxes.txt")
	} else { //hurtboxes
		_file = file_text_open_read("Hurtboxes.txt")	
	}
	i = 0;
	while (!file_text_eof(_file)) { //while there is file left to read
		_str = file_text_read_string(_file) //read name
		file_text_readln(_file)
		while (string(sprite_array[i, NAME]) != string(_str)) { //if not the right name
			i = (i + 1) mod array_height_2d(sprite_array) //loop through until it is found
			if (i = 0) {
				if (!show_question("LOOPING THROUGH ARRAY, CONTINUE SEARCHING?")) {
					exit;
				}
			}
		}
		file_text_readln(_file) //read past {
		o = 0; //reset frame counter
		while(true) {
			//read frame
			_str = file_text_read_string(_file)
			file_text_readln(_file)
			if (_str = "frame") {
				o = file_text_read_real(_file)
				file_text_readln(_file); //skip to next line
				file_text_readln(_file) //read past {
				j = 0; 
				while (true) { //read hitbox number
					//read frame
					_str = file_text_read_string(_file)
					file_text_readln(_file)
					if (_str = "hitbox") {
						j = file_text_read_real(_file)
						file_text_readln(_file); //skip to next line
						file_text_readln(_file) //read past {
						k = 0; 
						_str = file_text_read_string(_file)//read first data
						file_text_readln(_file)
						while (_str != "}") { //read data
							if (_hitbox) {
								hitbox[i*10 + j, 25*o + k] = real(_str) //set data 
							} else {
								hurtbox[i*10 + j, 25*o + k] = real(_str) //set data 
							}
							_str = file_text_read_string(_file)//read next line
							file_text_readln(_file)
							k++
						}
					} else {
						break;	
					}
				}
			} else {
				break;	
			}
		}
	}
	file_text_close(_file) //close the file
	_hitbox = true
}
show_debug_message(hurtbox)
show_debug_message(hitbox)


//hand off data to data object
with (obj_data) {
	hitbox = other.hitbox
	hurtbox = other.hurtbox
}


/*
old system
global.hitbox
[32000 sprites, 319 frames + 9 hitboxes + 11 entries]
[sprite_index, image_index*100 + index*11 + entry]

new system
global.hitbox_list[hitbox and hurtbox arrays]
global.hitbox_bal
[3200 sprites + 10 hitboxes, 1280 frames + 25 entries]
