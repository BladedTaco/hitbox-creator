//FAILED PROJECT TO USE MANUALLY ENTERED HITBOX DATA, JUST GONNA RESTART FROM SCRATCH


//load in the sprite sheet file locations
var _data = ds_map_secure_load("C:\\Users\\v2tac\\AppData\\Local\\Atavistic_Sanctum\\hitbox")
var _temp = ds_list_create()
ds_list_read(_temp, _data[? "hitbox"])
var a = _temp[| 0]
var b = _temp[| 1]
var c = a;
ds_map_destroy(_data)
ds_list_destroy(_temp)
	
var _array = [];
var rerun = false;

var j_d = [];
j_d = [0, 63, 123, 173, array_height_2d(c)]


////convert
//repeat(2) {
//	for (var j = 3; j >= 0; j--) {
//		if (rerun) {
//			_array = obj_data.hurtbox_list[j]
//		} else {
//			_array = obj_data.hitbox_list[j]
//		}
//		for (var i = j_d[j+1] - 1; i >= j_d[j]; i--) {
//			for (var o = array_length_2d(c, i) - 1; o >= 0; o--) {
//				_f = o div 100
//				_i = (o div 11) mod 100
//				_e = o mod 11
			
//				_s = i - j_d[j]
//				_array[@ _s*10 + _i, _f*25 + _e] = c[i, o]
//			}	
//		}
//	}
//	c = b
//}

rerun = false;
var j = 0;
var _add = 1;
var _alt_sprite = 0;

repeat(2) {
	for (var _sprite = 0; _sprite < j_d[4] - _add; _sprite++) {
		
		_alt_sprite = _sprite 
		if (_sprite < j_d[1]) {
			j = 0;
			_add = 1;
		} else if (_sprite < j_d[2]) {
			_alt_sprite = _sprite - j_d[1]
			j = 1
			_add = 0;
		} else if (_sprite < j_d[3]) {
			_alt_sprite = _sprite - j_d[2]
			j = 2
			_add = 0;
		} else if (_sprite < j_d[4]) {
			_alt_sprite = _sprite - j_d[3]
			j = 3
			_add = 0;
		}
		
		if (_alt_sprite == 0) {
			continue
		}
		
		if (rerun) {
			_array = obj_data.hurtbox_list[j]
		} else {
			_array = obj_data.hitbox_list[j]
		}
		
		for (var _index = 0; _index < floor(array_length_2d(c, _sprite)/100); _index++) {
			for (var _num = 0; _num < 9; _num++) {
				for (var _entry = 0; _entry < 11; _entry++) {
					_array[@ _alt_sprite*10 + _num, _index*25 + _entry] = c[_sprite + _add, _index*100 + _num*11 + _entry];
				}
			}
		}
	}
	rerun = true;
	c = b;
}

/*

[sprite, image_index*100 + index*11 + entry]
maps to
character_array[character]
[sprite_conversion*10 + index, image_index*25 + entry]


global.hitbox[i, o + 0] = argument[3]		//shape
global.hitbox[i, o + 1] = argument[4]		//major axis
global.hitbox[i, o + 2] = argument[5]		//minor axis
global.hitbox[i, o + 3] = argument[6]		//x
global.hitbox[i, o + 4] = argument[7]		//y
global.hitbox[i, o + 5] = argument[8]		//rotation
global.hitbox[i, o + 6] = argument[9]		//damage
global.hitbox[i, o + 7] = argument[10]		//direction
global.hitbox[i, o + 8] = argument[11]		//base knocback
global.hitbox[i, o + 9] = argument[12]		//scaling knockback
if (argument_count > 13) {
	global.hitbox[i, o + 10] = argument[13]	//hitstun multiplier
} else {
	global.hitbox[i, o + 10] = 1			//hitstun multiplier
}
	
mapping
shape, maj, min, x, y, rot, dmg, dir, bkb, skb, hitstun
	
	
	
	
/*
old system
global.hitbox
[32000 sprites, 319 frames + 9 hitboxes + 11 entries]
[sprite_index, image_index*100 + index*11 + entry]

new system
global.hitbox_list[hitbox and hurtbox arrays]
global.hitbox_bal
[3200 sprites + 10 hitboxes, 1280 frames + 25 entries]

title = ["SHP", "WID", "HEI", "X", "Y", "ROT", "DMG", "DIR", "BKB", "SKB", "STN", "FKB", "EFF"
, "G/A", "SHD", "PRI", "SND", "RFT", "ABS", "BLK", "HIT", "COL", "SDI", "IND", "FLP", "DEL", "*"]