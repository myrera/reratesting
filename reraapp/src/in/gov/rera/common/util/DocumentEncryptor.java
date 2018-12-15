package in.gov.rera.common.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.web.util.HtmlUtils;

import com.sun.mail.util.BASE64DecoderStream;
import com.sun.mail.util.BASE64EncoderStream;

public class DocumentEncryptor {

	private static Cipher ecipher;
	private static Cipher dcipher;

	private static byte[] keyValue = new byte[] { '0', '2', '3', '4', '5', '6', '7', '8', '9', '1', '2', '3', '4', '5',
			'6', '7' };

	static SecretKey key = new SecretKeySpec(keyValue, "AES");

	public static String encrypt(String str) {

		try {

			// encode the string into a sequence of bytes using the named
			// charset

			// storing the result into a new byte array.
			ecipher = Cipher.getInstance("AES");
			ecipher.init(Cipher.ENCRYPT_MODE, key);

			byte[] utf8 = str.getBytes("UTF8");

			byte[] enc = ecipher.doFinal(utf8);

			// encode to base64

			enc = BASE64EncoderStream.encode(enc);

			return new String(enc);

		}

		catch (Exception e) {

			e.printStackTrace();

		}

		return null;

	}

	public static String decrypt(String str) {

		try {

			// decode with base64 to get bytes
			dcipher = Cipher.getInstance("AES");
			dcipher.init(Cipher.DECRYPT_MODE, key);

			byte[] dec = BASE64DecoderStream.decode(str.getBytes());

			byte[] utf8 = dcipher.doFinal(dec);

			// create new string based on the specified charset

			return new String(utf8, "UTF8");

		}

		catch (Exception e) {

			e.printStackTrace();

		}

		return null;

	}
	public static void main(String[] args) throws UnsupportedEncodingException {
		System.out.println(encrypt("45279"));
		
		String encrypt=encrypt("45279");
		System.out.println(URLEncoder.encode("5zgYeLZeQhbL/jOogh+pXQ==",java.nio.charset.StandardCharsets.UTF_8.toString()));
		System.out.println(decrypt(encrypt("45279")));
	}
	

}
