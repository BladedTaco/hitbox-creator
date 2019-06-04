//@description define game macros

//sprite array macros
#macro NAME 0
#macro YPOS 1
#macro NUM 2
#macro WIDTH 3
#macro HEIGHT 4
#macro X_OFF 5
#macro Y_OFF 6
#macro SURFACE 7
#macro ID 8

//surface macros
#macro SURFACE_POWER 13 //increase if sprites are getting cut off sprite sheet

//callback macros
#macro GIVEN_NUMBER 0 
#macro BETWEEN 1

//shapes
global.shape = ["REC", "CIR", "TRI"];
global.shape[0] = "REC"
#macro SHAPES global.shape
#macro SHAPE_NUMBER array_length_1d(global.shape)

enum HITBOX_COL_ {
	HITBOX = c_red,
	HURTBOX = c_aqua
}