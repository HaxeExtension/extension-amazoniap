package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
	#if (openfl < "4.0.0")
	import openfl.utils.JNI;
	#else
	import lime.system.JNI;
	#end
#end


class Extension_iap_amazon {

	public static function sampleMethod (inputValue:Int):Int {

		#if (android && openfl)

		var resultJNI = extension_iap_amazon_sample_method_jni(inputValue);
		var resultNative = extension_iap_amazon_sample_method(inputValue);

		if (resultJNI != resultNative) {

			throw "Fuzzy math!";

		}

		return resultNative;

		#else

		return extension_iap_amazon_sample_method(inputValue);

		#end

	}

	#if (android && openfl)
	private static var extension_iap_amazon_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.Extension_iap_amazon", "sampleMethod", "(I)I");
	#end

}
