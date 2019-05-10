///@func scr_array_remove_entry(array, entry, element)
///@param array - the array to edit
///@param entry - the index to remove
///@param element* - 0 to remove first element row, 1 to remove second element column
///@desc removes a line of values from an array, returns a new array

var _array = argument[0]
var _ret = []
var j = 0

if (argument_count = 3) { //2d array
	if (argument[2] = 0) {
		for (var i = 0; i < array_height_2d(_array) - 1; i++) {
			if (i = argument[1]) {
				j = 1	
			}
			for (var o = 0; o < array_length_2d(_array, i + j); o++) {
				_ret[i, o] = _array[i + j, o]	
			}
		}
	} else {
		for (var i = 0; i < array_height_2d(_array); i++) {
			for (var o = 0; o < array_length_2d(_array, i) - 1; o++) {
				if (o = argument[1]) {
					j = 1	
				}
				_ret[i, o] = _array[i, o + j]	
			}
			j = 0
		}
	}
} else { //1d array
	for (var i = 0; i < array_length_1d(_array) - 1; i++) {
		if (i = argument[1]) {
			j = 1	
		}
		_ret[i] = _array[i + j]	
	}
}

return _ret