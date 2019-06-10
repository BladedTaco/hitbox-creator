///@func scr_draw_shape(shape, x, y, major, minor, rotation, outline_thickness)
///@param shape - the shape to draw
///@param x - the x position of the shape
///@param y - the y position of the shape
///@param major - the major axis
///@param minor - the minor axis
///@param rotation - the rotation of the shape
///@param outline_thickness - how thick the outline is
///@desc draws the given shape with the given parameters

var _shape, _x, _y, _maj, _min, _rot, _outline;
_shape		= argument[0]
_x			= argument[1]
_y			= argument[2]
_maj		= argument[3]
_min		= argument[4]
_rot		= argument[5]
_outline	= argument[6]

var _pos = [];
_pos = draw_set_rotation(_x, _y, _rot)

var _col = (c_white - draw_get_colour()) //get inverse of colour for outline drawing to make sure shape is always visible

switch (_shape) {
	case 1: //Rectangle
		//draw_rectangle(_pos[0] - _maj/2, _pos[1] - _min/2, _pos[0] + _maj/2, _pos[1] + _min/2, false)
		scr_draw_polygon_outline(_pos[0], _pos[1], _maj/sqrt(2), _min/sqrt(2), _maj, 360, 0, 4, 45)
		draw_set_colour(_col)
		scr_draw_polygon_outline(_pos[0], _pos[1], _maj/sqrt(2), _min/sqrt(2), _outline, 360, 1, 4, 45)
	break;
	
	case 2: //Ellipse
		//draw_ellipse(_pos[0] - _maj/2, _pos[1] - _min/2, _pos[0] + _maj/2, _pos[1] + _min/2, false)
		scr_draw_ellipse_outline(_pos[0], _pos[1], _maj/2, _min/2, _maj, 360, 0)
		draw_set_colour(_col)
		scr_draw_ellipse_outline(_pos[0], _pos[1], _maj/2, _min/2, _outline, 360, 1)
	break;
	
	case 3: //Triangle
		//draw_triangle(
		//	_pos[0] - _maj/2, _pos[1] + _min/2,
		//	_pos[0] + _maj/2, _pos[1] + _min/2,
		//	_pos[0], _pos[1] - _min/2,
		//	false
		//)
		scr_draw_triangle_outline(_pos[0], _pos[1], _maj, _min, _maj, 360, 0, 3, 0)
		draw_set_colour(_col)
		scr_draw_triangle_outline(_pos[0], _pos[1], _maj, _min, _outline, 360, 1, 3, 0)
	break;
	
	default: //no shape defined
		draw_line_width(_pos[0] - 15, _pos[1] - 15, _pos[0] + 15, _pos[1] + 15, 5)
		draw_line_width(_pos[0] + 15, _pos[1] - 15, _pos[0] - 15, _pos[1] + 15, 5)
	break;
}
draw_set_colour(c_white - _col)

//reset shader and rotation
draw_reset_rotation()
