package in.gov.rera.K2PaymentGateWay.service.impl;

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
import java.util.ResourceBundle;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;
import in.gov.rera.K2PaymentGateWay.service.IK2FeesIntegrationService;
import in.gov.rera.K2PaymentGateWay.service.IK2PaymentDetailService;

@Service(value = "K2FeesIntegrationService")
@Scope("request")
public class K2FeesIntegrationServiceImpl implements IK2FeesIntegrationService{

	@Autowired
	IK2PaymentDetailService<K2PaymentDetailsModel, Long> K2PaymentDetailsService;

	private static String AGENT_CODE = "EA_KHB";
	private static String INTEGRATION_CODE = "RCT033";
	private static String UIR_NO = AGENT_CODE + "-" + INTEGRATION_CODE;
	private static String DDO_CODE = "99807O";
	private static String DEPT_CODE = "19A";
	private static String DEPT_REF_NUM = "RERT";
	private static String TREASURY_CODE = "572A";

	//private static String SOAPUrl = "https://117.239.56.125/KhajaneWs/rct/rrvcs/secbc/RctReceiveValidateChlnService?wsdl";
	private static String SOAPUrl = "https://khajane2.karnataka.gov.in/KhajaneWs/rct/rrvcs/secbc/RctReceiveValidateChlnService?wsdl";
	private static ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
	private static String k2ackLoc = rb.getString("K2_FOLDER_PATH");
	private static String xmlFile2Send = k2ackLoc+"fees_template.xml";

	private static boolean isSuccess = false;

	@Override
	public String invokeK2PaymentGateway(String customerName, String amount,String paymentToken,String paymentType) throws Exception {

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

		s = populateXMLValues(s, deptRefNum, customerName, amount);

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
			StringBuffer sb = new StringBuffer();

			sb.append("dept_ref_no=");
			sb.append(deptRefNum);
			sb.append("|txn_date=" + new SimpleDateFormat("ddMMyyyy").format(new Date()));
			/*sb.append("|Remitter_Name=");
			sb.append(customerName);*/
			sb.append("|amount=");
			sb.append(amount);
			sb.append("|dept_pwd=1234");

			System.out.println(sb.toString());
			String test = "dept_ref_no=RERT260618190342|txn_date=26062018|amount=2|dept_pwd=1234";
			k2URL = K2URLGenerator.generateUrl(sb.toString(), DEPT_CODE);

			K2PaymentDetailsService.savePaymentDetails(customerName, amount,paymentToken, paymentType, deptRefNum);
			System.out.println(k2URL);
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

		return k2URL;

	}

	private static String signDocument(byte[] b) throws IOException {
		InputStream in = new ByteArrayInputStream(b);
		SignFile sf = new SignFile();
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

	private static String populateXMLValues(String s, String deptRefNum, String customerName, String totalAmount) {
		s = s.replaceAll("\\$agentCode", AGENT_CODE);
		s = s.replaceAll("\\$integrationCode", INTEGRATION_CODE);
		s = s.replaceAll("\\$uirNo", UIR_NO + "-" + new SimpleDateFormat("ddMMyyHHmmss").format(new Date()));
		s = s.replaceAll("\\$chalanDate", new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
		s = s.replaceAll("\\$deptCode", DEPT_CODE);
		s = s.replaceAll("\\$ddoCode", DDO_CODE);
		s = s.replaceAll("\\$amount", totalAmount);
		s = s.replaceAll("\\$totalAmount", totalAmount);
		s = s.replaceAll("\\$treasuryCode", TREASURY_CODE);
		s = s.replaceAll("\\$deptRefNum", deptRefNum);
		s = s.replaceAll("\\$customerName", customerName);
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