/// @func scrMsgClearInvalidTopic
/// @desc 清除无效的主题订阅，若订阅的观察者实例被删除的话就视为是个无效的订阅
function scrMsgClearInvalidTopic(){
    // 需要删除数据的缓存
    var needRemoveTopicMap = ds_map_create();

    for(var k = ds_map_find_first(msgMap); k != undefined; k = ds_map_find_next(msgMap, k)){
        var topicList = msgMap[? k];
        var len = ds_list_size(topicList);
        for (var i = 0; i < len; i++) {
            var msg = topicList[| i];
            // 查找topic中receiver是否已经失效了
            if (!instance_exists(msg.receiver)) {
                var needRemoveTopicList = undefined;
                if(needRemoveTopicMap[? k] == undefined) {
                    needRemoveTopicMap[? k] = ds_list_create();
                }
                needRemoveTopicList = needRemoveTopicMap[? k];
                ds_list_add(needRemoveTopicList, msg);
            }
        }
    }

    if (ds_map_size(needRemoveTopicMap) > 0) {
        for(var k = ds_map_find_first(needRemoveTopicMap); k != undefined; k = ds_map_find_next(msgMap, k)){
            var topicList = needRemoveTopicMap[? k];
            var len = ds_list_size(topicList);
            for (var i = 0; i < len; i++) {
                var msg = topicList[| i];
                // 注销消息
                unregister(k, msg);
            }
        }
    }
}