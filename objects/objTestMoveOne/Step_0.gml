/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(ord(up))) {
	y -= moveSpeed * delta_time * 0.000001
}
if (keyboard_check(ord(down))) {
	y += moveSpeed * delta_time * 0.000001
}
if (keyboard_check(ord(left))) {
	x -= moveSpeed * delta_time * 0.000001
}
if (keyboard_check(ord(right))) {
	x += moveSpeed * delta_time * 0.000001
}
//show_debug_message(string(x)+":"+string(y));