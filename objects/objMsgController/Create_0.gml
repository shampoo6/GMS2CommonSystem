/// @description Insert description here
// 消息控制器对象，用于注册，注销和发送消息，注册主题的实例，应该在 cleanup 事件中取消订阅

// 消息map
msgMap = ds_map_create();

#region 声明方法

// 注册
register = scrMsgRegister;
// 注销
unregister = scrMsgUnregister;
// 发消息
send = scrMsgSend;
// 清除无效订阅主题
claerInvalidTopic = scrMsgClearInvalidTopic

#endregion