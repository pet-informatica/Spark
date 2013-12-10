part of spark;

class GrandMessagingCenter extends Emitter{
	static GrandMessagingCenter _singleton;

	factory GrandMessagingCenter(){
	    if(_singleton == null){
	      _singleton = new GrandMessagingCenter._internal();
	    }
	    return _singleton;
	}

	GrandMessagingCenter._internal(){

	}
}