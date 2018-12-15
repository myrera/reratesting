package in.gov.rera.K2PaymentGateWay.service.impl;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.ResourceBundle;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class K2URLGenerator {

	private static String url = "https://k2.karnataka.gov.in/wps/portal/Khajane-II/Department/DepartmentGateway/?uri=receiptsample:com.tcs.departmentpage:departmentportlet&";
	//private static String url = "https://117.239.56.126/wps/portal/Home/DepartmentPayment/?uri=receiptsample:com.tcs.departmentpage:departmentportlet&";
	
	public static String[] decryptedDataArray(String encdata){

		System.out.println("encrypted "+encdata);
		String decryptedValue = decryptParameter("KEY","NA",encdata,"KHB_KHAJANE.key");
		System.out.println("\n Decryption:  "+ decryptedValue);
		String[] data=decryptedValue.split("\\|");
		String[] decdata=new String[data.length-1];
		for (int i = 0; i < data.length-1; i++) {
				decdata[i]=data[i].split("=")[1];
		}
		for (int i = 0; i < decdata.length; i++) {
			System.out.println(decdata[i]);
		}
		return decdata;
		
	}
	
	public static String generateUrl(String inputData,String deptCode) {

		String encryptedValue = null;
		StringBuffer sb=new StringBuffer();

		try {

			// String inputData =
			// "txn_date=07022015|challan_ref_no=CR0115005500012127|Remitter_Name=test123|challan_amount=1";
			// Step 1: Calculate Check sum for request
			String checkSum = getMD5Checksum(inputData);

			// Step2: Append checkSum to request and encrypt data
			inputData = inputData + "|checkSum=" + checkSum;
			// String encryptedValue= symmetricEnccrypt(inputData); // Simple
			// encryption sample
			encryptedValue = encryptParameter("KEY", "NA", inputData, "KHB_KHAJANE.key"); // File
			System.out.println(decryptParameter("KEY", "NA", encryptedValue, "KHB_KHAJANE.key"));
			
			sb.append(url);
			sb.append("encdata=");
			sb.append(URLEncoder.encode(encryptedValue,"UTF-8"));
			sb.append("&dept_code=");
			sb.append(deptCode);
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sb.toString();
	}

	public static byte[] createChecksum(String filename) throws Exception {
		InputStream fis = new ByteArrayInputStream(filename.getBytes());

		byte[] buffer = new byte[1024];
		MessageDigest complete = MessageDigest.getInstance("MD5");
		int numRead;
		do {
			numRead = fis.read(buffer);
			if (numRead > 0) {
				complete.update(buffer, 0, numRead);
			}
		} while (numRead != -1);
		fis.close();
		return complete.digest();
	}

	// see this How-to for a faster way to convert
	// a byte array to a HEX string
	public static String getMD5Checksum(String filename) throws Exception {
		byte[] b = createChecksum(filename);
		String result = "";
		for (int i = 0; i < b.length; i++) {
			result += Integer.toString((b[i] & 0xff) + 0x100, 16).substring(1);
		}
		return result;
	}

	public static String encryptParameter(String SecretKey, String InitVec, String ReqParam, String keyname) {
		String encryptedString = null;
		System.out.println("Starts --> BanksEncryptionClass --> encryptParameter");
		try {
			// System.out.println("Encryption Process");
			// System.out.println("SecretKey: "+SecretKey+" InitVec: "+InitVec+"
			// ReqParam: "+ReqParam+ " Filekey: "+keyname);
			Cipher cipher;

			byte[] encryptText = null;
			byte[] raw;
			SecretKeySpec skeySpec;
			byte[] ivy;
			IvParameterSpec ivSpec;
			sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
			sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
			try {

				encryptText = ReqParam.getBytes("UTF-8");

				if (SecretKey.equalsIgnoreCase("key")) {
					// System.out.println("File key available "+keyname);

					// URL keyFileURL =
					// getClass().getResource("/resource/"+keyname);
					// File keyFile = new File(keyFileURL.toURI());
					// System.out.println("keyFile");

					// FileInputStream fileinputstream = new
					// FileInputStream(keyFile);
					ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
					String k2ackLoc = rb.getString("K2_FOLDER_PATH");
					FileInputStream fileinputstream = new FileInputStream(k2ackLoc + keyname);
					byte[] abyte = new byte[fileinputstream.available()];
					fileinputstream.read(abyte);
					fileinputstream.close();
					byte[] keyBytes = new byte[16];
					int len = abyte.length;
					if (len > keyBytes.length)
						len = keyBytes.length;
					System.arraycopy(abyte, 0, keyBytes, 0, len);
					skeySpec = new SecretKeySpec(keyBytes, "AES");
					ivSpec = new IvParameterSpec(keyBytes);

				}

				else {
					// File key not available Secretkey available
					raw = decoder.decodeBuffer(SecretKey);
					byte[] keyBytes = new byte[16];
					int len = raw.length;
					if (len > keyBytes.length)
						len = keyBytes.length;
					System.arraycopy(raw, 0, keyBytes, 0, len);
					skeySpec = new SecretKeySpec(keyBytes, "AES");
					if (InitVec.equals("NA")) {
						// File key not available Secretkey available:>>>>
						// IVspec not available
						ivSpec = new IvParameterSpec(keyBytes);
						System.out.println("ivSpec");
					} else {
						// File key not available Secretkey available:>>>>
						// IVspec available
						ivy = decoder.decodeBuffer(InitVec);
						byte[] ivyKeyBytes = new byte[16];
						int len1 = ivy.length;
						if (len1 > ivyKeyBytes.length)
							len1 = ivyKeyBytes.length;
						System.arraycopy(raw, 0, ivyKeyBytes, 0, len1);
						ivSpec = new IvParameterSpec(ivyKeyBytes);
					}
				}

				cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
				cipher.init(Cipher.ENCRYPT_MODE, skeySpec, ivSpec);
				byte[] encbyte = cipher.doFinal(encryptText);
				encryptedString = encoder.encode(encbyte);

				// System.out.println("EncryptedString: "+encryptedString+"\n");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "File Error";
			}
		}

		catch (Exception e) {
			System.out.println("Error --> BanksEncryptionClass --> encryptParameter:" + e);
			// throw e;
		}
		System.out.println("Ends --> BanksEncryptionClass --> encryptParameter");
		return encryptedString;
	}

	public static String decryptParameter(String SecretKey, String InitVec, String ReqParam, String keyname) {
		String decryptedString = null;
		System.out.println("Starts --> BanksEncryptionClass --> decryptParameter");
		try {
			// System.out.println("Decryption Process");
			// System.out.println("SecretKey: "+SecretKey+" InitVec: "+InitVec+"
			// ReqParam: "+ReqParam+ " Filekey: "+keyname);
			sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();

			byte[] raw;
			SecretKeySpec skeySpec;
			byte[] ivy;
			IvParameterSpec ivSpec;
			try {

				// decryptedString=ReqParam.getBytes("UTF-8");
				// decryptText = decoder.decodeBuffer(ReqParam);

				if (SecretKey.equalsIgnoreCase("key")) {
					// System.out.println("File key
					// available"+keyname+"."+SecretKey);
					// FileInputStream fileinputstream;
					// URL keyFileURL =
					// getClass().getResource("/resource/"+keyname+".key");
					// File keyFile = new File(keyFileURL.toURI());
					// FileInputStream fileinputstream = new
					// FileInputStream(keyFile);
					ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
					String k2ackLoc = rb.getString("K2_FOLDER_PATH");
					FileInputStream fileinputstream = new FileInputStream(k2ackLoc + keyname);

					byte[] abyte = new byte[fileinputstream.available()];
					fileinputstream.read(abyte);
					fileinputstream.close();

					byte[] keyBytes = new byte[16];
					int len = abyte.length;
					if (len > keyBytes.length)
						len = keyBytes.length;
					System.arraycopy(abyte, 0, keyBytes, 0, len);
					skeySpec = new SecretKeySpec(keyBytes, "AES");
					ivSpec = new IvParameterSpec(keyBytes);
				}

				else {
					// File key not available Secretkey available
					raw = decoder.decodeBuffer(SecretKey);
					// raw = Base64.decodeBase64(SecretKey);

					byte[] keyBytes = new byte[16];
					int len = raw.length;
					if (len > keyBytes.length)
						len = keyBytes.length;
					System.arraycopy(raw, 0, keyBytes, 0, len);
					skeySpec = new SecretKeySpec(keyBytes, "AES");

					if (InitVec.equals("NA")) {
						// File key not available Secretkey available:>>>>
						// IVspec not available
						ivSpec = new IvParameterSpec(keyBytes);
					} else {
						// File key not available Secretkey available:>>>>
						// IVspec available
						ivy = decoder.decodeBuffer(InitVec);
						// ivy = Base64.decodeBase64(InitVec);
						byte[] ivyKeyBytes = new byte[16];
						int len1 = ivy.length;
						if (len1 > ivyKeyBytes.length)
							len1 = ivyKeyBytes.length;
						System.arraycopy(raw, 0, ivyKeyBytes, 0, len1);
						ivSpec = new IvParameterSpec(ivyKeyBytes);
					}
				}

				Cipher cipher1 = Cipher.getInstance("AES/CBC/PKCS5Padding");
				cipher1.init(Cipher.DECRYPT_MODE, skeySpec, ivSpec);
				byte[] results = decoder.decodeBuffer(ReqParam);
				// byte[] results= Base64.decodeBase64(ReqParam);
				byte[] ciphertext1 = cipher1.doFinal(results);
				decryptedString = new String(ciphertext1);
				// System.out.println("DecryptedString: "+decryptedString+"\n");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "File Error";
			} catch (Exception e) {
				e.printStackTrace();
				return "Error";
			}
		} catch (Exception e) {
			System.out.println("Error --> BanksEncryptionClass --> decryptParameter:" + e);
			// throw e;
		}
		System.out.println("Ends --> BanksEncryptionClass --> decryptParameter");

		return decryptedString;
	}

	public static String symmetricEnccrypt(String ReqParam) {

		Cipher cipher;
		String encryptedString = null;
		byte[] encryptText = null;
		SecretKeySpec skeySpec = null;
		IvParameterSpec ivSpec = null;
		sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();

		try {

			encryptText = ReqParam.getBytes("UTF-8");
			ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
			String k2ackLoc = rb.getString("K2_FOLDER_PATH");
			FileInputStream fileinputstream = new FileInputStream(k2ackLoc + "KHB_KHAJANE.key"); // key file path
			
			byte[] abyte = new byte[fileinputstream.available()];
			fileinputstream.read(abyte);
			fileinputstream.close();
			byte[] keyBytes = new byte[16];
			int len = abyte.length;
			if (len > keyBytes.length)
				len = keyBytes.length;
			System.arraycopy(abyte, 0, keyBytes, 0, len);
			skeySpec = new SecretKeySpec(keyBytes, "AES");
			ivSpec = new IvParameterSpec(keyBytes);
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec, ivSpec);
			byte[] encbyte = cipher.doFinal(encryptText);
			encryptedString = encoder.encode(encbyte);

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "File Error";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
		return encryptedString;
	}

	public static String symmetricDecrypt(String text) {
		Cipher cipher;
		String encryptedString;
		byte[] encryptText = null;
		byte[] raw;
		SecretKeySpec skeySpec;
		sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
		try {

			ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
			String k2ackLoc = rb.getString("K2_FOLDER_PATH");
			FileInputStream fileinputstream = new FileInputStream(k2ackLoc + "KHB_KHAJANE.key"); // key file path
			
			byte[] abyte = new byte[fileinputstream.available()];
			fileinputstream.read(abyte);
			fileinputstream.close();
			byte[] keyBytes = new byte[16];
			int len = abyte.length;
			if (len > keyBytes.length)
				len = keyBytes.length;
			System.arraycopy(abyte, 0, keyBytes, 0, len);
			skeySpec = new SecretKeySpec(keyBytes, "AES");
			encryptText = decoder.decodeBuffer(text);
			IvParameterSpec ivSpec = new IvParameterSpec(keyBytes);
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec, ivSpec);
			encryptedString = new String(cipher.doFinal(encryptText));
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
		return encryptedString;
	}

}
