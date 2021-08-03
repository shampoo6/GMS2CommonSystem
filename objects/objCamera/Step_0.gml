/// @description update position

if (!enable) return;

if (instance_exists(target)) {
	x = target.x;
	y = target.y;
}

// 边界定界
if (instance_exists(bound) && !ignoreBound) {
	if (x - halfW < bound.x) {
		x = bound.x + halfW;
	}
	else if (x + halfW > bound.x + bound.sprite_width) {
		x = bound.x + bound.sprite_width - halfW;
	}
	if (y - halfH < bound.y) {
		y = bound.y + halfH;
	}
	else if (y + halfH > bound.y + bound.sprite_height) {
		y = bound.y + bound.sprite_height - halfH;
	}
}