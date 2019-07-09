/// @description self-callback for switching

if (array_length_1d(caller_data) = 1) { //destination == source
	exit;	
}

show_debug_message(string("Caller Data: " + string(caller_data)))

var _source = caller_data[0]
var _dest = caller_data[1]

if (_source < _dest) { //moving downwards
	_dest -= 1 //update destination
}

if (_dest < hurtbox[frame]) { //hitbox
	if (_source > hurtbox[frame]) { //moving from hurtbox to hitbox
		hurtbox[frame] += 1
	}
} else if (_dest = hurtbox[frame]) { //could be either way
	hurtbox[frame] += sign(_source - _dest)
} else { //hurtbox
	if (_source <= hurtbox[frame]) { //moving from hitbox to hurtbox
		hurtbox[frame] -= 1
	}
}

table_list[frame] = scr_array_swap_entry(table_list[frame], 0, _source, _dest)

event_user(2)