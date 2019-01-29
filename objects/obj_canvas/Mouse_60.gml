/// @description zoom in
if (active) {
	if (zoom < 100) {
		do {
			//change offset based on triangular numbers sequence
			x_off += width*0.5/(zoom*(zoom+1))
			y_off += height*0.5/(zoom*(zoom+1))
			zoom += 1
		} until ((zoom mod 5 = 0) or (zoom < 10))
	}
}