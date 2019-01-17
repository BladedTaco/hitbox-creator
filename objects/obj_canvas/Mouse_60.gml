/// @description zoom in

if (zoom < 100) {
	//change offset based on triangular numbers sequence
	x_off += width*0.5/(zoom*(zoom+1))
	y_off += height*0.5/(zoom*(zoom+1))
	zoom += 1
}