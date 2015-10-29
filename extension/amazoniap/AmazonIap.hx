package extension.amazoniap;

#if android
import openfl.utils.JNI;
#end

class AmazonIap {

	private static inline var EXT_AMAZONIAP : String = "org.haxe.extension.amazoniap.Extension_iap_amazon";

	public static var _onProductDataResponse : String->Void;
	public static var _onPurchaseResponse : String->Void;
	public static var _onPurchaseUpdatesResponse : String->Void;
	public static var _onUserDataResponse : String->Void;

	var _isSandboxMode : Void->Bool;
	var _getUserData : Void->Void;
	var _purchase : String->Void;

	public function new () {
		var _init = JNI.createStaticMethod(
			EXT_AMAZONIAP,
			"init",
			"(Lorg/haxe/lime/HaxeObject;)V"
		);
		_init(this);
	}

	public function isSandboxMode () : Bool {
		if (_isSandboxMode==null) {
			_isSandboxMode = JNI.createStaticMethod(EXT_AMAZONIAP, "isSandboxMode", "()Z"
			);
		}
		return _isSandboxMode();
	}

	public function getUserData () : Void {
		if (_getUserData==null) {
			_getUserData = JNI.createStaticMethod(EXT_AMAZONIAP, "getUserData", "()V");
		}
		_getUserData();
	}

	public function purchase (sku : String) {
		if (_purchase==null) {
			_purchase = JNI.createStaticMethod(EXT_AMAZONIAP, "purchase", "(Ljava/lang/String;)V");
		}
	}

	function onProductDataResponse (data : String) : Void {
		if (_onProductDataResponse!=null) {
			_onPurchaseResponse(data);
		}
	}

	function onPurchaseResponse (data : String) : Void {
		if (_onPurchaseResponse!=null) {
			_onPurchaseResponse(data);
		}
	}

	function onPurchaseUpdatesResponse (data : String) : Void {
		if (_onPurchaseUpdatesResponse!=null) {
			_onPurchaseUpdatesResponse(data);
		}
	}

	function onUserDataResponse (data : String) : Void {
		if (_onUserDataResponse!=null) {
			_onUserDataResponse(data);
		}
	}

}
