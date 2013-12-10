part of spark;

abstract class Emitter{
	Map<String, List<Listener>> _eventMap;
	
	Emitter(){
		_eventMap = new Map<String, List<EventReceiver>>();
	}

	void addListener(Listener l, String messageType){
		if(!this._messageMap.containsKey(messageType)){
			this._messageMap[messageType] = new List<Listener>();
		}
		this._messageMap[messageType].add(l);
    }
	
	void addListener(Listener l){
		this.addListener(l, "__global__");
	}

	void emitMessage(Message m){
		String type = m.getMessageType();
		List<Listener> specific = this._messageMap[type];
		List<Listener> global = this._messageMap["__global__"];
		if(specific){
			for(int i = 0; i < specific.length; i++){
				specific[i].onMessageReceived(m);
			}
		}
		if(global){
			for(int i = 0; i < global.length; i++){
				global[i].onMessageReceived(m);
			}
		}
	}
}