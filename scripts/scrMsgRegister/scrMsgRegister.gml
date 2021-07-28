/// @func scrMsgRegister
/// @desc 注册消息
/// @param topic 消息主题
/// @param msg 消息结构
function scrMsgRegister(topic, msg) {
	var msgList = undefined;
	if(msgMap[? topic] == undefined) {
		msgMap[? topic] = ds_list_create();
	}
	msgList = msgMap[? topic];
	// 查看是否重复添加
	var index = ds_list_find_index(msgList, msg);
	// 若列表中没有就添加
	if (index == -1) {
		ds_list_add(msgList, msg);
	}
}