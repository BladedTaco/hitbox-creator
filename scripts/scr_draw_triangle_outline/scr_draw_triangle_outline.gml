///@func scr_draw_ellipse_outline(x, y, major_axis, minor_axis, thickness, sector_angle, type, sides, offset)
///@param x - the x position of the center of the polygon
///@param y - the y position of the center of the polygon
///@param major_axis - the width of the polygon
///@param minor_axis - the height of the polygon
///@param thickness - how thick to make the line
///@param sector_angle - how much of the polygon to draw (from 0 to 360 degrees)
///@param type - either inside, centered, or outside (0 1 2) respecively
///@param sides - the amount of vertices the polygon has
///@param offset - the offset to draw the vertices by
///@desc draws an ellipse shell with the given paramaters



//define vars
var i, steps, xx, yy, major, minor, inner_offset, outer_offset, angle;
steps = argument[7];	
xx = argument[0];
yy = argument[1];
major = argument[2];
minor = argument[3];

angle = argument[5];

var const_l = 0.12132034356
//var const_s = 1.20710678118 unused sadly
//paste below into desmos to find out what l and s are used for
//where a = w/sqrt(2) and b = h/sqrt(2)
//\frac{x^2}{a^2}\ +\ \frac{\left(y\ +\ b\cdot l\right)^2}{\frac{b}{s}^2}\ =\ r
//https://www.desmos.com/calculator/wmzsrluftn


//CHANGE MINOR AND MAJOR BASED ON SIDES, SEE IF ANGLE CHANIGNG WORKS


switch (argument[6]) { //based on outline type
	case 0: //inner
		inner_offset = min(argument[4], major, minor);
		outer_offset = 0;
	break;
	
	case 1: //centered
		inner_offset = min(argument[4]/2, major, minor);
		outer_offset = argument[4]/2;
	break;
	
	case 2: //outer
		inner_offset = 0;
		outer_offset = argument[4];
	break;
	
	default:
		inner_offset = 0;
		outer_offset = 0;
	break;
}



//translate bceause its not an equilateral triangle
yy += const_l*minor/sqrt(2)
major /= sqrt(2)
minor = minor/2 + (const_l * minor/sqrt(2))

//major_inner /= sqrt(2)
//minor_inner = minor_inner/2 + (const_l * minor_inner/sqrt(2))
//major_outer /= sqrt(2)
//minor_outer = minor_outer/2 + (const_l * minor_outer/sqrt(2))

var major_inner = max(major - inner_offset, 0)
var minor_inner = max(minor - inner_offset, 0)
var major_outer = max(major + outer_offset, 0)
var minor_outer = max(minor + outer_offset, 0)


//start the primitive
draw_primitive_begin(pr_trianglestrip);

//draw_vertex(xx, yy)
var ang;
//add each point around the circumference in a zig zag pattern
for(i = 0; i <= steps; i++) {
	//add inner width
	//ang = degtorad(argument[8] + i*135 mod 405)
	ang = degtorad((45 + i*90 + max((i-1), 0)*45))
	//draw_vertex(xx + lengthdir_x(major - inner_offset, angle * i / steps), yy + lengthdir_y(minor - inner_offset, angle * i / steps));
	draw_vertex(xx + (major_inner) * cos(ang), yy + (minor_inner) * sin(ang));
	//add outer width
	//draw_vertex(xx + lengthdir_x(major + outer_offset, angle * i / steps), yy + lengthdir_y(minor + outer_offset, angle * i / steps));
	draw_vertex(xx + (major_outer)* cos(ang), yy + (minor_outer)* sin(ang));
}

//draw the shape
draw_primitive_end();

//
//135, 270, 405, 135
//45, 135, 270, 45