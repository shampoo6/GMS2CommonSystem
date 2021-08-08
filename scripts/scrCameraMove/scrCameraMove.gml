/// @func scrCameraMoveImmediate
/// @desc 相机即时追踪
function scrCameraMoveImmediate(targetX, targetY){
	if(x == targetX && y == targetY) return;
	x = targetX;
	y = targetY;
	needUpdateView = true;
}

/// @func scrCameraMoveUniform
/// @desc 相机匀速追踪
function scrCameraMoveUniform(targetX, targetY){
	if(moveSpeed == 0) return;
	if(x == targetX && y == targetY) return;
	var dir = point_direction(x, y, targetX, targetY);
	var dis = distance_to_point(targetX, targetY);
	// 判断是否进入死区
	var e = dis <= moveSpeed * 0.03;
	// 相机移动不受暂停影响
	var _x = lengthdir_x(noPauseFrameSpeed, dir);
	var _y = lengthdir_y(noPauseFrameSpeed, dir);
	x = e? targetX: x + _x;
	y = e? targetY: y + _y;
	needUpdateView = true;
}

/// @func scrCameraMoveLerp
/// @desc 相机插值追踪
function scrCameraMoveLerp(targetX, targetY){
	if(lerpSpeed == 0) return;
	if(lerpSpeed == 1) {
		scrCameraMoveImmediate(targetX, targetY);
		return;
	}
	if(x == targetX && y == targetY) return;
	var dis = distance_to_point(targetX, targetY);
	if(dis <= 3) return;
	var dir = point_direction(x, y, targetX, targetY);
	// 判断是否进入死区
	var e = dis <= 3;
	var lerpLength = lerp(0, dis, lerpSpeed)
	var _x = lengthdir_x(lerpLength, dir);
	var _y = lengthdir_y(lerpLength, dir);
	x = e? targetX: x + _x;
	y = e? targetY: y + _y;
	needUpdateView = true;
}