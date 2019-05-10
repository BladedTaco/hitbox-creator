/// @description toggle hitbox selection mode

if (selection_mode) { //return to normal behaviour and send back data
	caller_data = array_sort_1d(caller_data, 0)
	
	//call the event for the caller
	with (caller) { 
		//data is held by the hitbox table object, therefore it can just be passed by reference
		caller_data = other.caller_data
		event_user(caller_event) //handle the received data
	}
	//send data
} else { //start selection mode
	caller_data = []
	caller_string = ""
}

selection_mode = !selection_mode //toggle selection mode