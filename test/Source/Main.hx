package;

import extension.amazoniap.AmazonIap;
import openfl.display.Sprite;

class Main extends Sprite {

	function print (str : String) : Void {
		trace("asda: " + str);
	}

	public function new () {

		super ();
		var amz = new AmazonIap();
		AmazonIap._onProductDataResponse = print;
		AmazonIap._onPurchaseResponse = print;
		AmazonIap._onPurchaseUpdatesResponse = print;
		AmazonIap._onUserDataResponse = print;
		trace("Amazon: " + amz.isSandboxMode());
		amz.purchase("asda");

	}

}