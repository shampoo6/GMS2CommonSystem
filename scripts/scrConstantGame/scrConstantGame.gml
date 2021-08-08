// 宏

// 移动速度
#macro noPauseFrameSpeed moveSpeed * delta_time * 0.000001					// 物体每帧移动速度 moveSpeed 为所有可以移动物体的移动速度
#macro frameSpeed (global.pause? 0: moveSpeed * delta_time * 0.000001)


// 全局变量
global.pause = false;																						// 暂停