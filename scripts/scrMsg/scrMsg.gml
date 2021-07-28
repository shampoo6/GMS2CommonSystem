/// @func Msg
/// @desc 消息结构
/// @param _receiver 消息接收者
/// @param _handler 消息处理程序，可以是函数或脚本
function Msg(_receiver, _handler) constructor {
	if (_receiver == undefined || _receiver == noone || _receiver == pointer_null) {
		throw ("receiver required");
	}
	if (typeof(_handler)=="method") {
		type = "method";
	} else if (script_exists(_handler)) {
		type = "script";
	} else {
		throw ("handler must be a method or script");
	}
	
	receiver = _receiver;
	handler = _handler;
}