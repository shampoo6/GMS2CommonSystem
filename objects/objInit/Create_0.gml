/// @description first room for init game

// 初始化layer
layer_create(global.layerConfig.Bg.depth, global.layerConfig.Bg.name);

// 初始化全局对象
instance_create_layer(0, 0, global.layerConfig.Bg.name, objMsgController);
instance_create_layer(0, 0, global.layerConfig.Bg.name, objInput);

room_goto_next();