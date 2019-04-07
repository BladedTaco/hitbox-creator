///@func scr_array_add_entry(array, element, source, dest)
///@param array - the array to edit
///@param element - 0 to add [first element] row, 1 to add [second element] column
///@param source - the original location of the data
///@param dest - the new location for the data to be moved to
///@desc moves a line of a 2d array, directly editing the array
//will wrap entrys to array bounds

var _array = argument[0]

if (argument[1] = 0) { //add a new row (iterate across the second element)
	var _source = clamp(argument[2], 0, array_height_2d(_array)-1)
	var _dest = clamp(argument[3], 0, array_height_2d(_array)-1)
	var _add = []
	//get source entry copied
	for (var i = 0; i < array_length_2d(_array, _source); i++) {
		_add[i] = _array[_source, i]	
	}
} else { //add a new column (iterate across the first element
	var _source = clamp(argument[2], 0, array_length_2d(_array, 0)-1)
	var _dest = clamp(argument[3], 0, array_length_2d(_array, 0)-1)
	for (var i = 0; i < array_height_2d(_array); i++) {
		_source = min(_source, array_length_2d(_array, i)-1)
		_dest = min(_dest, array_length_2d(_array, i)-1)
	}
	var _add = []
	//get source entry copied
	for (var i = 0; i < array_height_2d(_array); i++) {
		_add[i] = _array[i, _source]	
	}
}

_array = scr_array_remove_entry(argument[0], _source, argument[1])
scr_array_add_entry(_array, _dest, argument[1], _add)

return _array