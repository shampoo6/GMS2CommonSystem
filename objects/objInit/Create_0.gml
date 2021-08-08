/// @description first room for init game

#macro viewWidth global.resolutionConfig.widthTileCount * global.resolutionConfig.tileSize
#macro viewHeight global.resolutionConfig.heightTileCount * global.resolutionConfig.tileSize
#macro halfViewWidth viewWidth * 0.5
#macro halfViewHeight viewHeight * 0.5

// 初始化layer
layer_create(global.layerConfig.Bg.depth, global.layerConfig.Bg.name);

// 初始化全局对象r
instance_create_layer(0, 0, global.layerConfig.Bg.name, objMsgController);
instance_create_layer(0, 0, global.layerConfig.Bg.name, objInput);

// 设置显示方案
window_set_size(viewWidth * global.resolutionConfig.zoom, viewHeight * global.resolutionConfig.zoom);
surface_resize(application_surface, viewWidth, viewHeight);
display_reset(global.graphicsConfig.aa, global.graphicsConfig.vsync);
room_speed = 60;

// 相机设置
camera_destroy(camera_get_default());

room_goto_next();