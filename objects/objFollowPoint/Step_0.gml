/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(target) || offset == 0) return;

if (target.faceX == 0 && target.faceY == 0) {
	x = target.x;
	y = target.y;
} else {
	var dir = point_direction(0, 0, target.faceX, target.faceY);
	var _x = lengthdir_x(offset, dir);
	var _y = lengthdir_y(offset, dir);
	x = target.x + _x;
	y = target.y + _y;
}