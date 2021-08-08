/// @description update position

if (!enabled) return;

if (instance_exists(target)) {
	switch(followType){
		case CameraFollowType.Immediate:
			scrCameraMoveImmediate(target.x, target.y);
			break;
		case CameraFollowType.Uniform:
			scrCameraMoveUniform(target.x, target.y);
			break;
		case CameraFollowType.Lerp:
			scrCameraMoveLerp(target.x, target.y);
			break;
	}
}

// 边界定界
if (instance_exists(bound) && !ignoreBound) {
	if (x - halfViewWidth < bound.x) {
		x = bound.x + halfViewWidth;
	}
	else if (x + halfViewWidth > bound.x + bound.sprite_width) {
		x = bound.x + bound.sprite_width - halfViewWidth;
	}
	if (y - halfViewHeight < bound.y) {
		y = bound.y + halfViewHeight;
	}
	else if (y + halfViewHeight > bound.y + bound.sprite_height) {
		y = bound.y + bound.sprite_height - halfViewHeight;
	}
	needUpdateView = true;
}

// 若自动关闭相机 每次相机step后都会禁用相机逻辑
if (autoDisable) enabled = false;