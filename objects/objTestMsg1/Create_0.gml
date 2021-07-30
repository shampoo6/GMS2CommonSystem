/// @description Insert description here
// You can write your code in this editor

name = "objTestMsg1";

// 注册
objMsgController.register("TestTopic", new Msg(self, function(payload){
	show_debug_message(name + " receive TestTopic: " + payload);
}));

alarm[0] = 60