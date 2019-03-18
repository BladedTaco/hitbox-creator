/// @description get hitboxes

var _str = "" 
var _file = "" //file
var i, o, j, k, _hitbox; //sprite number, frame number, hitbox number, data point number, loop index
_hitbox = false




//create arrays and sub arrays
var _box, _box2;
_box = []; _box2 = [];
_box[0, 0] = sprite_num //number of previous 'base sprite'
i = sprite_num
//get the starting sprite numbers
while (i > 0) {
	i--
	if (string_copy(sprite_array[i, NAME], 9, 4) = "base") { //if a new character
		_box = array_create((_box[0, 0] - i)*10, -10) //create an array with height equal to sprites
		_box[0, 0] = i //store the base sprite index
		show_debug_message(sprite_array[i, SURFACE])
		hitbox_list[sprite_array[i, SURFACE]] = _box
		_box = array_create(array_height_2d(_box), -10) //create an array with height equal to sprites
		hurtbox_list[sprite_array[i, SURFACE]] = _box
	}
}

for (var j = 0; j < array_length_1d(hitbox_list); j++) {
	_box = hitbox_list[j]
	_box2 = hurtbox_list[j]
	//set null value array
	for (i = array_height_2d(_box); i >= 0; i--) {
		for (o = frame_max*25; o >= 0; o--) {
			_box[i, o] = -10
			_box2[i, o] = -10
		}
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
				show_debug_message(_str)
				if (!show_question("LOOPING THROUGH ARRAY, CONTINUE SEARCHING?")) {
					exit;
				}
			}
		}
		if (_hitbox) {
			_box = hitbox_list[sprite_array[i, SURFACE]]	
		} else {
			_box = hurtbox_list[sprite_array[i, SURFACE]]
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
							_box[i*10 + j, 25*o + k] = real(_str) //set data 
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
show_debug_message("HITBOXES AND HURTBOXES---------'")
show_debug_message(hurtbox_list)
show_debug_message(hitbox_list)
for (i = 0; i < array_length_1d(hurtbox_list); i++) {
	show_debug_message(hurtbox_list[i])
	show_debug_message("")
	show_debug_message(hitbox_list[i])
	show_debug_message("\n")
}


//hand off data to data object
with (obj_data) {
	//SEE IF ARRAYS NEED TO BE INDIVIDUALLY COPIED
	hurtbox_list = other.hurtbox_list
	hitbox_list	= other.hitbox_list
}

//CHECK OBJ DATA IF ITS HANDELED RIGHT

/*
old system
global.hitbox
[32000 sprites, 319 frames + 9 hitboxes + 11 entries]
[sprite_index, image_index*100 + index*11 + entry]

new system
global.hitbox_list[hitbox and hurtbox arrays]
global.hitbox_bal
[3200 sprites + 10 hitboxes, 1280 frames + 25 entries]
