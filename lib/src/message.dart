part of spark;

abstract class Message{
	final Object sender;

	Message(this.sender);

	String getMessageType(){
		return this.runtimeType.toString();
	}
}