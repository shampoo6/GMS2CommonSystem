/// @func scrMsgUnregister
/// @desc 注销消息
/// @param topic 注销的消息主题
/// @param msg 注销的消息结构
function scrMsgUnregister(topic, msg){
    if (!ds_map_exists(msgMap, topic)) return;
    // 获取消息列表
    var msgList = msgMap[? topic];
    var index = ds_list_find_index(msgList, topic);
    if (index != -1) {
        // 从列表中删除注册的观察者
        ds_list_delete(msgList, index);
        // 如果没有观察者就删除
        if ds_list_size(msgList) == 0 {
            ds_list_destroy(msgList);
            ds_map_delete(msgMap, topic);
        }
    }
}