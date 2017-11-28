//PLayer Input
key_right = keyboard_check(ord("D"))
if (key_right) {
 sprite_index = playerWalkRight;
  image_speed = 2;
}
key_left = keyboard_check(ord("A"))
if (key_left) {
 sprite_index = playerWalkLeft;
  image_speed = 2;
}
key_down = keyboard_check(ord("S"))
if (key_down) {
 sprite_index = playerWalkFoward;
  image_speed = 2;
}
key_up = keyboard_check(ord("W"))
if (key_up) {
 sprite_index = playerWalkBack;
 image_speed = 2;
}
key_null = keyboard_check(vk_nokey)
if (key_null) {
    image_speed = 0;
    image_index = 0;
}
key_jump = keyboard_check_pressed(vk_space);

//Get Movement

var move = key_right - key_left;

hsp = move * walkspeed;

vsp = vsp + grv;

if (place_meeting(x,y+1,objWall)) && (key_jump)
{

 vsp = -7;
}

//X Collision
if (place_meeting(x+hsp,y,objWall))
{
	while (!place_meeting(x+sign(hsp),y,objWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;
//Y Collision
if (place_meeting(x,y+vsp,objWall))
{
	while (!place_meeting(x,y+sign(vsp),objWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;