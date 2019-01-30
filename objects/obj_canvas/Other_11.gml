/// @description update frame
if (sprite > -1) { //if there is a sprite to draw
	//draw the sprite with appropirate zoom and offset
	var _col = 0 //x modifier value
	var _row = 0 //y modifier value
	for (var i = 0; i < obj_data.sprite_array[sprite, NUM]; i++) {
		//check if the current frame
		if (frame =  i) {
			//get frame position and break loop
			frame_x = _col*frame_width
			frame_y = _row*frame_height
			break;
		}
		//get place next frame is drawn
		_col++ //move one space across
		if ((_col+1)*frame_width > surface_get_width(canvas)) { //if that space runs off the surface
			_col = 0 //move back to starting column
			_row++ //move down one row
		}
	}
}