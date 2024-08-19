 //step event//

var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("Q"));
var jump = keyboard_check_pressed(vk_space);
var onTheGround = place_meeting(x, y + 1, oWall);

if (xDirection != 0) image_xscale = xDirection;

xSpeed = xDirection * spd;
ySpeed++;

if (onTheGround) {
	if (xDirection != 0) { sprite_index = Spritz_walk_0001; } 
	else { sprite_index = Spritz_idle_0001; }

	if (jump) {
		ySpeed = -15;
	}
} else {
	sprite_index = Spritz_Jump_export;
}  

if (xDirection != 0) and (spd < 15)
{spd = spd + 0.1}
if not(xDirection != 0)
{spd = 5}

if (spd > 10) and (onTheGround) {sprite_index = Spritz_RunFast_0001_export}
if (place_meeting(x + xSpeed, y, oWall)) { 
	
	while (!place_meeting(x + sign(xSpeed), y, oWall)) {
		x += sign(xSpeed);
	}
	
	xSpeed = 0; 
}

x += xSpeed;


if (place_meeting(x, y + ySpeed, oWall)) { 
	
	while (!place_meeting(x, y + sign(ySpeed), oWall)) {
		y += sign(ySpeed);
	}
	
	ySpeed = 0; 
}

y += ySpeed;