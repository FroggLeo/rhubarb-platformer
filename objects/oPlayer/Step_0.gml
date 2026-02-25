y_speed += .2; // add gravity to y_speed

if not global.justwon {
	x_speed = 0; // reset horizontal speed 
	if keyboard_check(vk_right) {  // if the right arrow key is pressed

	    x_speed = walk_speed;  // set the horizontal speed to heidi's walk_speed
		image_xscale = -1; // flip heidi's sprite so she faces right
	} else if keyboard_check(vk_left) {  // otherwise, if the left arrow key is pressed

	    x_speed = -walk_speed;  // set the horizontal speed to negative heidi's walk_speed, making her move left
		image_xscale = 1; // reset her sprite so she faces left
	}
}

move_and_collide(x_speed, y_speed, oSolid);

if (place_meeting(x, y + 1, oSolid)) { // if heidi is on the ground
	if global.justwon {
		global.justwon = false;
	}
    if (keyboard_check_pressed(vk_up)) { // and the up arrow key is pressed

        y_speed = -4; // make heidi jump by setting her y_speed to a negative value

    } else { // otherwise, if heidi is on the ground but not jumping

        y_speed = 0; // set her y_speed to 0 so she doesn't fall through the ground

    }

} else if (place_meeting(x, y -1, oSolid)) {
	y_speed = 0;
}

if (place_meeting(x, y - 0.5, oSpikes)) { // if heidi collides with the spikes

    fail() // restart the level

}

if (place_meeting(x, y, oFlag)) { // if heidi collides with the spikes
    global.scores++;
	global.justwon = true;
	x_speed = -3.6;
	y_speed = -6.3;
}

if (y > room_height or y < 0 or x > room_width or x < 0) { // if the player is outside of the room

    fail(); 

}

function fail() {
	x=48;
	y=96;
	x_speed = 0;
	y_speed = 0;
	global.scores--;
}