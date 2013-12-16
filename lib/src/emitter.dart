part of spark;

abstract class Emitter{
	Map<String, List<Listener>> _messageMap;
	
	Emitter(){
		_messageMap = new Map<String, List<Listener>>();
	}

	void addListener(Listener l,[String messageType="__global__"]){
		if(!this._messageMap.containsKey(messageType)){
			this._messageMap[messageType] = new List<Listener>();
		}
		this._messageMap[messageType].add(l);
    }

	void emitMessage(Message m){
		String type = m.getMessageType();
		List<Listener> specific = _messageMap[type];
		List<Listener> global = _messageMap["__global__"];
		if(specific != null){
			for(int i = 0; i < specific.length; i++){
				specific[i].onMessageReceived(m);
			}
		}
		if(global != null){
			for(int i = 0; i < global.length; i++){
				global[i].onMessageReceived(m);
			}
		}
	}
}