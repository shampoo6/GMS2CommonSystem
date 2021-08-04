/// @description Insert description here
// You can write your code in this editor

// 输入检测并移动
if (objInput.up) {
	scrCollisionMoveY(-frameSpeed, [objCollisionWall]);
	faceY = -1;
}
if (objInput.down) {
	scrCollisionMoveY(frameSpeed, [objCollisionWall]);
	faceY = 1;
}
if (objInput.left) {
	scrCollisionMoveX(-frameSpeed, [objCollisionWall]);
	faceX = -1;
}
if (objInput.right) {
	scrCollisionMoveX(frameSpeed, [objCollisionWall])
	faceX = 1;
}

// 调整朝向
if (objInput.up || objInput.down) {
	if (!objInput.left && !objInput.right) faceX = 0;
} else if (objInput.left || objInput.right) {
	if (!objInput.up && !objInput.down) faceY = 0;
}

// 手动开启相机
if (objInput.up || objInput.down || objInput.left || objInput.right)
	objCamera.enabled = true;