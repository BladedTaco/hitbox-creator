///@func draw_set_rotation(px, py, rotation)
///@param px - the x position of the point
///@param py - the y position of the point
///@rotation - the amount to rotate the points by in degrees
///@desc - rotates the draw world and returns the point equivalent to the unrotated point
///reset with draw_reset_rotation when done with rotating

var _dir = argument[2]
var _mat = matrix_build(0, 0, 0, 0, 0, -_dir, 1, 1, 1) //build rotated matrix
matrix_set(matrix_world, _mat) //set the world matrix to the built one
_dir = degtorad(-_dir) //set _dir to its radian counterpart
//return the new centre position to draw the object at
return [(argument[0])*cos(_dir) - (argument[1])*sin(_dir), (argument[0])*sin(_dir) + (argument[1])*cos(_dir)]
