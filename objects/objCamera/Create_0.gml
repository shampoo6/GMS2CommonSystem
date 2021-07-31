/// @description init camera
// 使用前请销毁默认相机 camera_destroy(camera_get_default());

#region 属性

// index	相机 view_camera 的索引
// target	跟踪对象
// bound	边界对象
// w			相机试图宽度(单位: tile宽)
// h			相机试图宽度(单位: tile高)

// 用于控制 step 中的逻辑是否运行
enable = true;

needUpdateView = false;
needUpdateProj = false;

// 忽略边框
ignoreBound = false;
// 视图大小
viewW = w * global.cameraConfig.tileW;
viewH = h * global.cameraConfig.tileH;
// 相机正上方向量
cameraUpX = 0;
cameraUpY = 1;

x = 0;
y = 0;
z = -100;

#endregion

#region 初始化

camera = camera_create();
view_camera[index] = camera;

var projMat = matrix_build_projection_ortho(viewW, viewH, 1, 10000);
camera_set_proj_mat(camera, projMat);
var viewMat = matrix_build_lookat(x, y, z, x, y, 0, cameraUpX, cameraUpY, 0);
camera_set_view_mat(camera, viewMat);

view_enabled = true;
view_visible[index] = true;

#endregion

show_debug_message(index);
show_debug_message(target);