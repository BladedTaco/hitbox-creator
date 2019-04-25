/// @description init variables
y_off = -1
max_y = -1
border = 2
width = image_xscale - border
height = image_yscale - border
table = []
active = false
surface = -1
sprite = -1
hitbox = false
hurtbox = -1
//set column titles
title = ["SHP", "WID", "HEI", "X", "Y", "ROT", "DMG", "DIR", "BKB", "SKB", "STN", "FKB", "EFF"
, "G/A", "SHD", "PRI", "SND", "RFT", "ABS", "BLK", "RBD", "TYP", "SDI", "IND", "FLP", "DEL", "*"]
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
"SHD - SHIELD DAMAGE, the damage multiplier to shields based off normal damage", 
"PRI - PRIORITY / CLANG, if the hitbox is able to cancel out another hitbox (priority value)", 
"SND - SOUND EFFECT, the index of the sound(s) to play", 
"RFT - REFLECTIVENESS, if the hitbox is able to be reflected, usually a projectile", 
"ABS - ABSORPTIVENESS, if the hitbox is able to be absorbed, usually a projectile", 
"BLK - BLOCKABILITY, if the hitbox can be shielded to avoid", 
"RBD - REBOUND, if the sprite is changed with another sprite when clanging", 
"TYP - TYPE, The type group of the attack such as legs, arms, disjoint.", 
"SDI - SDI MULTIPLIER, the multipler of how easy it is to smash DI out of the attack", 
"IND - INDIRECTIVENESS, if the hitbox is disjointed and seperate from the character", 
"FLP - ANGLE FLIPPER, if the hitbox knockback angle changes based on the relative position of the enemy",
"DEL - DELETE, to delete the hitbox, requires confirmation",
"* - MOVE, to move the place of the hitbox"]