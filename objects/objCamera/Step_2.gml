/// @description update view

var projMat = matrix_build_projection_ortho(viewW, viewH, 1, 10000);
camera_set_proj_mat(camera, projMat);
var viewMat = matrix_build_lookat(x, y, z, x, y, 0, cameraUpX, cameraUpY, 0);
camera_set_view_mat(camera, viewMat);