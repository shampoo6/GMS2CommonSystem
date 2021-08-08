/// @description update view
if (needUpdateProj){
	scrCameraUpdateProj();
	needUpdateProj = false;
}

if (needUpdateView) {
	scrCameraUpdateView();
	needUpdateView = false;
}
