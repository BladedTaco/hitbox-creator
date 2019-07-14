/// @description init variables
y_off = []
max_y = []
border = 4
width = image_xscale - border
height = image_yscale - border
active = false
surface = -1
table_list = [] //holds an array for each table array frame for the sprite
sprite = -1
frame = -1
hitbox = false
hurtbox = []
caller = noone;
caller_event = -1
caller_data = [];
caller_string = ""
caller_shift = -1
caller_type = -1
caller_sub_type = -1
caller_multiselect = true;
caller_sort = true;
caller_started = false;
selection_mode = false;
update = false;
saved = true;

//set table ranges and increments
//		  "SHP",			"WID", "HEI",	"X",	"Y",	"ROT",	"DMG",	"DIR",	"BKB",	"SKB", "STN",	"FKB",	"EFF",	"G/A",	"SHD",	"PRI",	"SND",		"RFT",	"ABS",	"BLK", "HIT",	"COL",	"SDI",	"IND", "FLP"
min_val = [0,				1,		1,		-999,	-999,	0,		-99,	0,		-99,	-99,	-1,		0,		0,		0,		-99,	-99,	0,			0,		0,		0,		0,		0,		0,		0,		0]
max_val = [SHAPE_NUMBER,	999,	999,	999,	999,	360,	99,		365,	99,		99,		99,		1,		99,		2,		99,		99,		infinity,	1,		1,		1,		99,		2,		10,		1,		1]
inc_val = [1,				1,		1,		1,		1,		5,		1,		1,		1,		1,		1,		1,		1,		1,		1,		1,		1,			1,		1,		1,		1,		1,		0.1,	1,		1]

//				"SHP",			"WID", "HEI",	"X",	"Y",	"ROT",	"DMG",	"DIR",	"BKB",	"SKB", "STN",	"FKB",	"EFF",	"G/A",	"SHD",	"PRI",	"SND",		"RFT",	"ABS",	"BLK", "HIT",	"COL",	"SDI",	"IND", "FLP"
min_val_alt = [0,				1,		1,		-999,	-999,	0,		-99,	0,		-99,	-99,	-1,		0,		0,		0,		-99,	-99,	0,			0,		0,		0,		0,		0,		0,		0,		0]
max_val_alt = [SHAPE_NUMBER,	999,	999,	999,	999,	360,	99,		365,	99,		99,		99,		1,		99,		2,		99,		99,		infinity,	1,		1,		1,		99,		2,		10,		1,		1]
inc_val_alt = [1,				1,		1,		1,		1,		5,		1,		1,		1,		1,		1,		1,		1,		1,		1,		1,		1,			1,		1,		1,		1,		1,		0.1,	1,		1]
	
//set column titles
title = ["SHP", "WID", "HEI", "X", "Y", "ROT", "DMG", "DIR", "BKB", "SKB", "STN", "FKB", "EFF"
, "G/A", "SHD", "PRI", "SND", "RFT", "ABS", "BLK", "HIT", "COL", "SDI", "IND", "FLP", "DEL", "*"]
desc = ["SHP - SHAPE, the shape of the hitbox", 
"WID - WIDTH, the horizontal size of the hitbox (pre rotation)", 
"HEI - HEIGHT, the vertical size of the hitbox (pre rotation)", 
"X - X, the horizontal position of the centre of the hitbox", 
"Y - Y, the vertical position of the centre of the hitbox", 
"ROT - ROTATION, the rotation of the hitbox shape.", 
"DMG - DAMAGE, the damage value inflicted by the hitbox", 
"DIR - DIRECTION the direction the knockback is applied in", 
"BKB - BASE KNOCKBACK, the knockback that is always the same regardless of enemy damage", 
"SKB - SCALING KNOCKBACK, the knockback that changes based on the enemys percent", 
"STN - HITSTUN, the amount of frames the hitbox applies of histun", 
"FKB - FIXED KNOCKBACK, knockback that ignored the formula and is always consistent (true or false)", 
"EFF - EFFECT, the hit type effect of the move, e.g. lighting, fire", 
"G/A - GROUNDEDNESS / AIRNESS, whether the hitbox affects grounded, airborne or both targets (0 1 2 respectively)", 
"SHD - SHIELD DAMAGE, the damage to shields", 
"PRI - PRIORITY / CLANG, if the hitbox is able to cancel out another hitbox (priority value)", 
"SND - SOUND EFFECT, the index of the sound group to play from", 
"RFT - REFLECTIVENESS, if the hitbox is able to be reflected, usually a projectile", 
"ABS - ABSORPTIVENESS, if the hitbox is able to be absorbed, usually a projectile", 
"BLK - BLOCKABILITY, if the hitbox can be shielded to avoid", 
"HIT - REHIT, the amount of frames until the opponent can be hit again (0 for never)", 
"COL - COLLATERAL, if the hitbox interacts with a grabbed opponent (no, yes, only) (0 1 2)", 
"SDI - SDI MULTIPLIER, the multipler of how easy it is to smash DI out of the attack", 
"IND - INDIRECTIVENESS, if the hitbox is disjointed and seperate from the character", 
"FLP - ANGLE FLIPPER, if the hitbox knockback angle changes based on the relative position of the enemy",
"DEL - DELETE, to delete the hitbox, requires confirmation",
"* - MOVE, to move the place of the hitbox"]

title_alt = ["SHP", "WID", "HEI", "X", "Y", "ROT", "DMG", "DIR", "BKB", "SKB", "STN", "FKB", "EFF"
, "G/A", "SHD", "PRI", "SND", "RFT", "ABS", "BLK", "HIT", "COL", "SDI", "IND", "FLP", "DEL", "*"]
desc_alt = ["SHP - SHAPE, the shape of the hitbox", 
"WID - WIDTH, the horizontal size of the hitbox (pre rotation)", 
"HEI - HEIGHT, the vertical size of the hitbox (pre rotation)", 
"X - X, the horizontal position of the centre of the hitbox", 
"Y - Y, the vertical position of the centre of the hitbox", 
"ROT - ROTATION, the rotation of the hitbox shape.", 
"sound - the sound effect to play",
"SDI mul - the multiplier to SDI strength",
"damageable - if it interacts with hitboxes",
"intangible - if it interacts with hurtboxes",
"contact damage - if hurts other hurtboxes",
"strong - if it takes damage",
"braced - if it takes knockback",
"strong armour - the damage it takes before it is affected",
"braced armour - the knockback it takes before it is affected",
"reflective - if it reflects",
"shielding - if its a shield",
"absorbing - if it absorbs",
"grabbing - if its a grabber",
"special - if it runs a special script",
"knockback mul - the multiplier to knockback",
"damage mul - the multiplier to damage",
"hitstun mul - the multiplier to hitstun",
"grab hitbox - the hitbox that takes damage and stuff from grabs",
"solid - if the hitbox is able to clip the stage",
"DEL - DELETE, to delete the hitbox, requires confirmation",
"* - MOVE, to move the place of the hitbox"]


//["SHP", "WID", "HEI", "X", "Y", "ROT"]
/*
NEW HITBOX PROPERTIES
sprite
image
hitbox
- - - - - - - - - - - - --  -- - - - -  - -- 
shape - ADD TRIANGLE, allows isocles and equilateral; ADD SEMI-CIRCLE
width
height
x
y
rotation
damage,
direction
base
scaling
hitstun
- - - - - - - - - - new properties
fixed knockback?
effect type
groundedness/airness
shield damage
clang / priority
sound effect
reflectiveness
absorptiveness
blockability
rebound
type?
SDI mul
directiveness? indirect
angle flipper?