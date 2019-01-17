/// @description populate data object

//get status of data object
var _data = noone
if (!instance_exists(obj_data)) {
	//create data object
	_data = instance_create_depth(0, 0, 0, obj_data)
} else {
	//reference data object
	_data = obj_data
}

//hand off data to data object
with (obj_data) {
	surface = other.surface 
	sprite_array = other.sprite_array
	sprite_num = other.sprite_num 
}