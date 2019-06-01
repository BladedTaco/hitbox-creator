///@func draw_set_rotation(px, py, rotation)
///@param px - the x position of the point
///@param py - the y position of the point
///@param rotation - the amount to rotate the points by in degrees
///@desc - returns the position of the point rotated around (0,0)

var _dir = degtorad(-argument[2]) //set _dir to its radian counterpart
//return the new centre position to draw the object at
return [(argument[0])*cos(_dir) - (argument[1])*sin(_dir), (argument[0])*sin(_dir) + (argument[1])*cos(_dir)]
