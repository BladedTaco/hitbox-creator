/// @description toggle hitbox selection mode

if (selection_mode) { //return to normal behaviour and send back data
	if (array_length_1d(caller_data) > 0) { //data to send
		if (caller_sort) {
			caller_data = array_sort_1d(caller_data, 0)
		}
		
		//call the event for the caller and transfer data
		with (caller) { 
			//data is held by the hitbox table object, therefore it can just be passed by reference
			caller_data = other.caller_data
			event_user(caller_event) //handle the received data
		}
	}
	caller_string = "" //empty the caller string
	caller_type = -1
	caller_sub_type = -1
	caller_multiselect = true;
	caller_shift = -1;
	caller_sort = true;
} else { //start selection mode
	if !((caller_type = BETWEEN) and (caller_sub_type = 1)) { //not forcing on no data
		if (!hitbox) { //not a valid time to select
			exit; //end the event, dont start selection mode
		}
	}
	
	if (instance_exists(obj_button_pause)) {
		with (obj_button_pause) {
			instance_change(obj_button_play, false)
		}
	}
	caller_data = [];
	caller_started = true;
	if ((caller_type = BETWEEN) or ((caller_type = GIVEN_NUMBER) and (caller_sub_type = 1))) { //single option
		caller_multiselect = false;	
	} else { //many options
		caller_multiselect = true	
	}
}

selection_mode = !selection_mode //toggle selection mode