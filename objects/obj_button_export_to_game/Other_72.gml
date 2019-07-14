/// @description 
if (async_load[? "id"] = backup) {
	backup_result = sign(async_load[? "status"] - 0.5)
	backup_result = round(backup_result*room_speed*5)
	
	if (global.output_file = "") { //no output file
		//ask for the output file
		global.output_file = get_save_filename("Gamemaker Code File|*.gml", "")
	}
	
	file_copy(working_directory + "default\\Output_Buffer.buff", global.output_file)
}