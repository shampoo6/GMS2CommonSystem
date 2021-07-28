/// @func scrMsgSend
/// @desc 发送事件
/// @param topic 消息主题
/// @param payload 消息参数
function scrMsgSend(topic, payload){
    if (!ds_map_exists(msgMap, topic)) return;
    var msgList = msgMap[? topic];
    var len = ds_list_size(msgList);
    var needRemoveList = ds_list_create(); // 需要被注销的消息缓存
    // 读取主题下的所有观察者并发送消息
    for (var i=0; i < len; i++) {
        var msg = msgList[| i];
        var receiver = msg.receiver;
        var handler = msg.handler;
        // 如果事件接收者不存在 或 事件处理程序返回了true
        // 那么调用完事件以后就移除该事件
        var remove = false;
        if (!instance_exists(receiver)) remove = true;
        else {
            with (receiver) {
                if (msg.type == "method") {
                    remove = handler(payload);
                } else if (msg.type == "script") {
                    remove = script_execute(handler, payload);
                }
            }
        }
        if (remove) {
            ds_list_add(needRemoveList, msg);
        }
    }
	
    // 若存在需要注销的消息
    len = ds_list_size(needRemoveList);
    if (len > 0) {
        for (var i=0; i < len; i++) { 
            var msg = needRemoveList[| i];
            scrMsgUnregister(topic, msg);
        }
    }
}