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
	
var _s, _f, _i, _e;
var _array = [];
var rerun = false;

var j_d = [];
j_d = [0, 63, 123, 173, array_height_2d(c)]


//convert
repeat(2) {
	for (var j = 3; j >= 0; j--) {
		if (rerun) {
			_array = obj_data.hurtbox_list[j]
		} else {
			_array = obj_data.hitbox_list[j]
		}
		for (var i = j_d[j+1] - 1; i >= j_d[j]; i--) {
			for (var o = array_length_2d(c, i) - 1; o >= 0; o--) {
				_f = o div 100
				_i = (o mod 100) div 11
				_e = o mod 11
			
				_s = i - j_d[j]
				_array[@ _s*10 + _i, _f*25 + _e] = c[i, o]
			}	
		}
	}
	c = b
}
/*

[sprite, image_index*100 + index*11 + entry]
maps to
character_array[character]
[sprite_conversion*10 + index, image_index*25 + entry]


creator = global.bbox[10]
shape = global.bbox[0]
_maj = global.bbox[1]
_min = global.bbox[2]
_dir = global.bbox[3]
_dir = degtorad(_dir)
if (global.bbox[4]) { //hitbox
hitbox = true
d = global.bbox[5] //damage
a = global.bbox[6] //direction of knocbkac
b = global.bbox[7] //base knocback
s = global.bbox[8] //scaling knocback
h = global.bbox[9]*creator.hitstun //hitstun multiplie
	
	
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