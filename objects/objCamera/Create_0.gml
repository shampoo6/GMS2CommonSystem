/// @description init camera
// 使用前请销毁默认相机 camera_destroy(camera_get_default());

#region 属性

// enabled			用于控制 step 中的逻辑是否运行
// autoDisable		是否自动关闭相机 enabled
// index				相机 view_camera 的索引
// viewBound		视图边界对象
// target				跟踪对象
// bound				边界对象
// moveSpeed		相机移动速度 若值为-1则即时跟随
// lerpSpeed		插值追踪速度

needUpdateView = false;
needUpdateProj = false;

// 忽略边框
ignoreBound = false;
// 相机正上方向量
cameraUpX = 0;
cameraUpY = 1;
cameraUpZ = 0;

x = instance_exists(target)? target.x: 0;
y = instance_exists(target)? target.y: 0;
z = -100;

#endregion

#region 初始化

camera = camera_create();
view_camera[index] = camera;

scrCameraUpdateProj();
scrCameraUpdateView();

view_enabled = true;
view_visible[index] = true;

#endregion