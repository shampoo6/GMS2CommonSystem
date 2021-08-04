/// @description update position

if (!enabled) return;

if (instance_exists(target)) {
	var _x = undefined;
	var _y = undefined;

	// 移动逻辑
	if (moveSpeed == -1) {
		_x = target.x;
		_y = target.y;
	} else {
		// 匀速运动
		
		var dir = point_direction(x, y, target.x, target.y);
		var dis = distance_to_point(target.x, target.y)
		var e = dis <= moveSpeed * 0.03;
		var _x = lengthdir_x(moveSpeed * delta_time * 0.000001, dir);
		var _y = lengthdir_y(moveSpeed * delta_time * 0.000001, dir);
		_x = e? target.x: x + _x;
		_y = e? target.y: y + _y;
	}
	
	if (x != _x || y != _y) {
		x = _x;
		y = _y;
		if (!instance_exists(bound) || ignoreBound)
			needUpdateView = true;
	}
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
	needUpdateView = true;
}

if (autoDisable) enabled = false;