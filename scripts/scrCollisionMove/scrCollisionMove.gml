/// @func scrCollisionMoveX
/// @desc 水平移动并检测碰撞 若发生碰撞则不移动
/// @param _speed 移动速度(一帧中的移动增量)
/// @param checkObjs 用于碰撞检测的数组 碰撞检测将对数组中每个成员进行
function scrCollisionMoveX (_speed, checkObjs) {
	var len = array_length(checkObjs);
	var c = false;
	var spDir = sign(_speed);
	for (var i = 0; i < len; i++) {
		var obj = checkObjs[i];
		c = c || place_meeting(x + spDir, y, obj);
		if (c) break;
	}
	if (!c) x += _speed;
	return c;
}

/// @func scrCollisionMoveY
/// @desc 竖直移动并检测碰撞 若发生碰撞则不移动
/// @param _speed 移动速度(一帧中的移动增量)
/// @param checkObjs 用于碰撞检测的数组 碰撞检测将对数组中每个成员进行
function scrCollisionMoveY (_speed, checkObjs) {
	var len = array_length(checkObjs);
	var c = false;
	var spDir = sign(_speed);
	for (var i = 0; i < len; i++) {
		var obj = checkObjs[i];
		c = c || place_meeting(x, y + spDir, obj);
		if (c) break;
	}
	if (!c) y += _speed;
	return c;
}