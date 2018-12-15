package in.gov.rera.K2PaymentGateWay;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import in.gov.rera.K2PaymentGateWay.service.impl.SignFileForChalanVerification;

public class TestK2IVerifyChallanService{

	private static String AGENT_CODE = "EA_KHB";

	private static String INTEGRATION_CODE = "RCT034";

	private static String UIR_NO = AGENT_CODE + "-" + INTEGRATION_CODE;

	private static String DEPT_REF_NUM = "";


	//private static String SOAPUrl = "https://117.239.56.125/KhajaneWs/rct/rrpys/secbc/RctReceivePaymentStatusService?wsdl";
	private static String SOAPUrl = "https://khajane2.karnataka.gov.in/KhajaneWs/rct/rrpys/secbc/RctReceivePaymentStatusService?wsdl";
	private static ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
	private static String k2ackLoc = rb.getString("K2_FOLDER_PATH");
	private static String xmlFile2Send = k2ackLoc+"verifyChallan_template.xml";

	static Map<String, String> pendingStatusDataMap=new HashMap<String , String>();
	
	private static boolean isSuccess = false;

	public static void main(String[] args) throws Exception {
		System.out.println(new TestK2IVerifyChallanService().invokeK2PaymentGateway("RERT020718155825")); //change ref num
		
		System.out.println("raja");
		/*for (Map.Entry<String,String> entry : pendingStatusDataMap.entrySet()) 
            System.out.println("Key = " + entry.getKey() +
                             ", Value = " + entry.getValue());
		System.out.println("raja");*/
	}

	public Map<String, String> invokeK2PaymentGateway(String challanRefNum) throws Exception {

		String k2URL = null;

		skipSSLCertificateValidation();

		// Create the connection with http
		URL url = new URL(SOAPUrl);
		URLConnection connection = url.openConnection();
		HttpURLConnection httpConn = (HttpURLConnection) connection;
		FileInputStream fin = new FileInputStream(xmlFile2Send);
		ByteArrayOutputStream bout = new ByteArrayOutputStream();

		copy(fin, bout);
		fin.close();

		byte[] b = bout.toByteArray();
		StringBuffer buf = new StringBuffer();
		String s = new String(b);
		String deptRefNum = DEPT_REF_NUM + new SimpleDateFormat("ddMMyyHHmmss").format(new Date());

		s = populateXMLValues(s,challanRefNum);

		System.out.println(s);

		b = s.getBytes();

		String signature = signDocument(b);

		s = new String(b);
		s = s.replaceAll("\\$signature", signature);

		b = s.getBytes();

		// Set the appropriate HTTP parameters.
		httpConn.setRequestProperty("Content-Length", String.valueOf(b.length));
		httpConn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
		httpConn.setRequestProperty("SOAPAction", "");
		httpConn.setRequestMethod("POST");
		httpConn.setDoOutput(true);

		// send the XML that was read in to b.
		OutputStream out = httpConn.getOutputStream();
		out.write(b);
		out.close();

		// Read the response.
		httpConn.connect();
		System.out.println("http connection status :" + httpConn.getResponseMessage());
		InputStream httpStream = httpConn.getInputStream();
		readXML(httpStream);

		if (isSuccess) {

			System.out.println("----------------------RCT034 SUCCESS");
		}

		/*
		 * InputStreamReader isr = new InputStreamReader(httpStream);
		 * BufferedReader ins = new BufferedReader(isr);
		 * 
		 * FileOutputStream fos = new FileOutputStream(responseFileName);
		 * copy(httpStream, fos);
		 * 
		 * ins.close();
		 */

		return pendingStatusDataMap;

	}

	private static String signDocument(byte[] b) throws IOException {
		InputStream in = new ByteArrayInputStream(b);
		SignFileForChalanVerification sf = new SignFileForChalanVerification();
		String signature = sf.signDocument(in);
		in.close();
		return signature;
	}

	private static void skipSSLCertificateValidation() throws NoSuchAlgorithmException, KeyManagementException {
		TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
			public java.security.cert.X509Certificate[] getAcceptedIssuers() {
				return null;
			}

			public void checkClientTrusted(X509Certificate[] certs, String authType) {
			}

			public void checkServerTrusted(X509Certificate[] certs, String authType) {
			}
		} };

		// Install the all-trusting trust manager
		SSLContext sc = SSLContext.getInstance("SSL");
		sc.init(null, trustAllCerts, new java.security.SecureRandom());
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

		// Create all-trusting host name verifier
		HostnameVerifier allHostsValid = new HostnameVerifier() {
			public boolean verify(String hostname, SSLSession session) {
				return true;
			}
		};

		// Install the all-trusting host verifier
		HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
	}

	private static String populateXMLValues(String s, String challanRefNum) {
		s = s.replaceAll("\\$agentCode", AGENT_CODE);
		s = s.replaceAll("\\$integrationCode", INTEGRATION_CODE);
		s = s.replaceAll("\\$uirNo", UIR_NO + "-" + new SimpleDateFormat("ddMMyyHHmmss").format(new Date()));
		s = s.replaceAll("\\$deptRefNum", challanRefNum);
		return s;
	}

	public static void copy(InputStream in, OutputStream out) throws IOException {

		synchronized (in) {
			synchronized (out) {
				byte[] buffer = new byte[256];
				while (true) {
					int bytesRead = in.read(buffer);
					if (bytesRead == -1)
						break;
					out.write(buffer, 0, bytesRead);
				}
			}
		}
	}

	private static void readXML(InputStream fXmlFile) {

		try {

			// File fXmlFile = new
			// File("/Users/tejomaya/Downloads/newsignresponse.xml");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(fXmlFile);

			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

			if (doc.hasChildNodes()) {

				printNote(doc.getChildNodes());

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private static void printNote(NodeList nodeList) {
		System.out.println(nodeList.getLength());
		if (isSuccess)
			return;

		for (int count = 0; count < nodeList.getLength(); count++) {

			Node tempNode = nodeList.item(count);

			// make sure it's element node.
			if (tempNode.getNodeType() == Node.ELEMENT_NODE) {

				if ("statusDescription".equalsIgnoreCase(tempNode.getNodeName())) {
					if ("Success".equalsIgnoreCase(tempNode.getTextContent()))
						isSuccess = true;
					return;
				}

				// get node name and value
				System.out.println("\nNode Name =" + tempNode.getNodeName() + " [OPEN]");
				System.out.println("Node Value =" + tempNode.getTextContent());
				
				if(tempNode.getNodeName().equals("deptRefNum")||tempNode.getNodeName().equals("bankName")
						||tempNode.getNodeName().equals("pymntMode")||tempNode.getNodeName().equals("paidAmount")
						||tempNode.getNodeName().equals("pymntstatus"))
				pendingStatusDataMap.put(tempNode.getNodeName().toString(), tempNode.getTextContent().toString());

				if (tempNode.hasAttributes()) {

					// get attributes names and values
					NamedNodeMap nodeMap = tempNode.getAttributes();

					for (int i = 0; i < nodeMap.getLength(); i++) {

						Node node = nodeMap.item(i);
						System.out.println("attr name : " + node.getNodeName());
						System.out.println("attr value : " + node.getNodeValue());

					}

				}

				if (tempNode.hasChildNodes()) {

					// loop again if has child nodes
					printNote(tempNode.getChildNodes());

				}

				System.out.println("Node Name =" + tempNode.getNodeName() + " [CLOSE]");

			}

		}

	}

}