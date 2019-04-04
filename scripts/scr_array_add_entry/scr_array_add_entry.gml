///@func scr_array_add_entry(array, entry, element, data)
///@param array - the array to edit
///@param entry - the index to insert the data into
///@param element - 0 to add [first element] row, 1 to add [second element] column
///@param data - the 1d array of data to add
///@desc adds a line of values from a 2d array, directly editing the array
//if the given add is shorter than the array, then some values will not be overidden

if (argument[1] < 0) { //negative entry, not possible exit execution
	show_message("IMPROPER USE OF ENTRY ADDITION")
	return false 
} 

var _array = argument[0]
var _add = argument[3]

if (argument[2] = 0) { //add a new row (iterate across the second element)
	for (var i = array_height_2d(_array) - 1; i >= argument[1]; i--) { //shift all superior entries up a place
		for (var o = 0; o < array_length_2d(_array, i); o++) {
			_array[@ i + 1, o] = _array[i, o]
		}
	}
	//insert the data
	for (var o = 0; o < array_length_1d(_add); o++) { //insert the new data
		_array[@ i+1, o] = _add[o]
	}
} else { //add a new column (iterate across the first element
	for (var i = 0; i < array_length_1d(_add); i++) {
		for (var o = array_length_2d(_array, i) - 1; o >= argument[1]; o--) { //shift all latter entries across
			_array[@ i, o + 1] = _array[i, o] 
		}
		//insert the data
		_array[@ i, o + 1] = _add[i]
	}
}
