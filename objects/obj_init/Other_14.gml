/// @description get hitboxes
var _str = "" 
var _file = file_text_open_read("Hurtboxes.txt") //open file
while (!file_text_eof(_file)) { //while there is file left to read
	_str = file_text_readln(_file) //read name
}

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
