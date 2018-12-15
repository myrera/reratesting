package in.gov.rera.common.util;

import java.util.HashMap;
import java.util.Map;

public class BaseEncryptor {

	private Map<String, String> m = new HashMap<String, String>();
	private Map<String, String> mm = new HashMap<String, String>();
	private String[] keys = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
			"s", "t", "u", "v", "w", "x", "y", "z", " " };
	private String[] values = { "D", "9", "I", "8", "N", "7", "E", "6", "S", "5", "H", "4", "R", "3", "K", "2", "A",
			"1", "@", "$", "%", "&", "*", "!", "0", "X", "Q" };

	public BaseEncryptor() {
		setMap();
		setDMap();
	}

	public void setMap() {
		for (int i = 0; i < keys.length; i++) {
			m.put(keys[i], values[i]);
		}
	}

	public void setDMap() {
		for (int i = 0; i < values.length; i++) {
			mm.put(values[i], keys[i]);
		}
	}

	public String encrypt(String value) {
		String data = "";
		char[] cc = value.toCharArray();
		int len = cc.length;
		int count = 0;
		for (int i = 0; i < m.size(); i++) {
			if (count < len) {
				data = data + m.get("" + cc[i] + "");
				count++;
			}
		}
		return data;
	}

	public String decrypt(String value) {
		String data = "";
		char[] cc = value.toCharArray();
		int len = cc.length;
		int count = 0;
		for (int i = 0; i < mm.size(); i++) {
			if (count < len) {
				data = data + mm.get("" + cc[i] + "");
				count++;
			}
		}
		return data;
	}

	public boolean checkPassword(String plain, String encrypted) {

		return encrypted.equals(this.encrypt(plain));

	}
}