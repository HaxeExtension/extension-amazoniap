package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
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