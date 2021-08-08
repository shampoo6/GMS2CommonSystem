function scrCameraUpdateView(){
	var viewMat = matrix_build_lookat(x, y, z, x, y, 0, cameraUpX, cameraUpY, cameraUpZ);
	camera_set_view_mat(camera, viewMat);
}

function scrCameraUpdateProj(){
	var projMat = matrix_build_projection_ortho(viewWidth, viewHeight, 10, 10000);
	camera_set_proj_mat(camera, projMat);
}