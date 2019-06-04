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

//start the primitive
draw_primitive_begin(pr_trianglestrip);

//draw_vertex(xx, yy)
var ang;
//add each point around the circumference in a zig zag pattern
for(i = 0; i <= steps; i++) {
	//add inner width
	ang = degtorad(argument[8] + i*360/steps)
	//draw_vertex(xx + lengthdir_x(major - inner_offset, angle * i / steps), yy + lengthdir_y(minor - inner_offset, angle * i / steps));
	draw_vertex(xx + (major - inner_offset) * cos(ang), yy + (minor - inner_offset) * sin(ang));
	//add outer width
	//draw_vertex(xx + lengthdir_x(major + outer_offset, angle * i / steps), yy + lengthdir_y(minor + outer_offset, angle * i / steps));
	draw_vertex(xx + (major + outer_offset)* cos(ang), yy + (minor + outer_offset)* sin(ang));
}

//draw the shape
draw_primitive_end();