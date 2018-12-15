package in.gov.rera.K2PaymentGateWay.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.Security;
import java.security.Signature;
import java.security.cert.CertStore;
import java.security.cert.CollectionCertStoreParameters;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.events.XMLEvent;

import org.bouncycastle.cms.CMSProcessableByteArray;
import org.bouncycastle.cms.CMSSignedData;
import org.bouncycastle.cms.CMSSignedDataGenerator;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import com.sun.org.apache.xml.internal.security.c14n.Canonicalizer;
import com.sun.org.apache.xml.internal.security.utils.Base64;

public class PenaltySignFile {

	ByteArrayOutputStream fileWriter = null;
	StringBuilder content=null;
	String currPath="";
	static StringBuilder signatureContent=null;
	
	static final String keystoreType = "JKS";
	static final ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
	static final String k2ackLoc = rb.getString("K2_FOLDER_PATH");
	
	static final String keystoreFile = k2ackLoc+"keystore.jks";
	static final String keystorePass = "Welcome@123";
	static final String privateKeyAlias = "rera.karnataka.gov.in";
	static final String privateKeyPass = "Welcome@123";
	static final String KEYSTORE_ALIAS = "rera.karnataka.gov.in";
	
	/*static SecurityUtil util = new SecurityUtil();*/
	/**
	 * @param args
	 */
	public static void main(String[] args) {

		try {
			ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
			String k2ackLoc = rb.getString("K2_FOLDER_PATH");
			String filePath=k2ackLoc+"penalty_template.xml";
			PenaltySignFile sign=new PenaltySignFile();
			//sign.signDocument(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	public String signDocument(InputStream is) {

		ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		String k2ackLoc = rb.getString("K2_FOLDER_PATH");

		File fileLoc=new File(k2ackLoc+"penalty_template.xml");
		
		String signedData = "";
		FileReader fileReader = null;
		try {
			XMLInputFactory factory = XMLInputFactory.newInstance();
			fileReader = new FileReader(fileLoc);
			XMLStreamReader reader = factory.createXMLStreamReader(is);
			content=new StringBuilder();
			// Parsing XML using stream reader and writing to a ByteArrayOutputStream
			while (reader.hasNext()) {
				int eventType = reader.next();
				switch (eventType) {

				case XMLEvent.START_ELEMENT:
					
					currPath = currPath + "/" + reader.getLocalName();
					//Instead
					if (currPath.contains("data")) {
						String startTag = "";
						//Instead
						if (reader.getLocalName().equalsIgnoreCase("data")) {
							fileWriter = new ByteArrayOutputStream();
							startTag = "<" + reader.getLocalName();
							for (int k = 0; k < reader.getNamespaceCount(); k++) {
								if (reader.getNamespacePrefix(k) != null)
									startTag = startTag + " xmlns:" + reader.getNamespacePrefix(k) + "=\"" + reader.getNamespaceURI(k) + "\"";
								else
									startTag = startTag + " xmlns=\"" + reader.getNamespaceURI(k) + "\"";
							}
							startTag = startTag + ">";
						} else {
							startTag = "<" + reader.getLocalName() + ">";
						}
						
						if (fileWriter != null)
							fileWriter.write(startTag.getBytes());
					}
					break;

				case XMLStreamConstants.CHARACTERS:
			     		processSigText(reader.getText());
					break;

				case XMLStreamConstants.END_ELEMENT:
					//Instead
					if (currPath.contains("data")) {
						String endTag = "</" + reader.getLocalName() + ">";
						
						if (fileWriter != null) {
							fileWriter.write(endTag.getBytes());
						}
					} 
					content = new StringBuilder();
					removeLasttag();
					break;

				case XMLEvent.CDATA:
				case XMLEvent.SPACE:

				}
			}
			
			// Canonicalizing the file begin
			System.out.println("Document Length Before : "+fileWriter.toByteArray().length);
			com.sun.org.apache.xml.internal.security.Init.init();
			Canonicalizer canon = Canonicalizer.getInstance(Canonicalizer.ALGO_ID_C14N_OMIT_COMMENTS);
			byte canonXmlBytes[] = canon.canonicalize(fileWriter.toByteArray());
			System.out.println("Document Length After : "+canonXmlBytes.length);
			// Canonicalizing the file End
			
			try {
			Security.addProvider(new BouncyCastleProvider());
			// Sign date with key store
			//byte[] sigBytes = signWithoutDataWithKS(new String(canonXmlBytes));
			//SIGN DATA WITH PFX FILE
			byte[] sigBytes = signWithoutDataWithKS(new String(canonXmlBytes));
			
			
			signedData = Base64.encode(sigBytes);
			signedData = "-----BEGIN PKCS7-----\n" + signedData + "\n-----END PKCS7-----";
			System.out.println(signedData);
			}
			catch(Exception e) {
				e.printStackTrace();
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return signedData;
	}	
	public void removeLasttag() {
		currPath = currPath.substring(0, currPath.lastIndexOf("/"));
	}
	private void processText(String text) {
		content.append(text);
	}
	private void processSigText(String text) throws Exception {
		try {
			if (fileWriter != null) {
				fileWriter.write(text.getBytes());
			}
		} catch (IOException e) {
			throw e;
		}
	}
public byte[] signWithoutDataWithKS(String data) {
		
		byte[] signedBytes=null;
			
		String KEYSTORE_FILE = "C:\\Users\\683538\\Desktop\\Arundhati\\signature\\khajaneea.p12";
		   String KEYSTORE_INSTANCE = "PKCS12";
		   String KEYSTORE_PWD = "password";
		  // String KEYSTORE_ALIAS = "khajaneea";
		
		try {
			
			   Security.addProvider(new BouncyCastleProvider());

	          /* KeyStore ks = KeyStore.getInstance(KEYSTORE_INSTANCE);
	           ks.load(new FileInputStream(KEYSTORE_FILE), KEYSTORE_PWD.toCharArray());
	           Key key = ks.getKey(KEYSTORE_ALIAS, KEYSTORE_PWD.toCharArray());*/
	           
	           
	           
	           KeyStore ks = KeyStore.getInstance(keystoreType);
	           FileInputStream fis = new FileInputStream(keystoreFile);
	           ks.load(fis, keystorePass.toCharArray());
	           PrivateKey privKey =
	                   (PrivateKey) ks.getKey(privateKeyAlias, privateKeyPass.toCharArray());
	      	
	      	
	          
	           
	          
	          // X509Certificate cert =
	            //       (X509Certificate) ks.getCertificate(certificateAlias);
	           

	           //Sign
	          // PrivateKey privKey = (PrivateKey) key;
	           Signature signature = Signature.getInstance("SHA1WithRSA", "BC");
	           signature.initSign(privKey);
	           signature.update(data.getBytes());

	           //Build CMS
	           X509Certificate signerCert =(X509Certificate) ks.getCertificate(KEYSTORE_ALIAS); 
	           
	           
				java.security.PublicKey publicKey = signerCert.getPublicKey();
				Security.addProvider(new BouncyCastleProvider());
				CMSSignedDataGenerator generator = new CMSSignedDataGenerator();
				generator.addSigner(privKey, signerCert, CMSSignedDataGenerator.DIGEST_SHA1);
				ArrayList list = new ArrayList();
				list.add(signerCert);
				//System.out.println(signerCert);
				CertStore _certStore = CertStore.getInstance("Collection", new CollectionCertStoreParameters(list), "BC");
				
				generator.addCertificatesAndCRLs(_certStore);
				org.bouncycastle.cms.CMSProcessable content = new CMSProcessableByteArray(data.getBytes());
				CMSSignedData signedData = generator.generate(content, false, "BC");			
				signedBytes = signedData.getEncoded();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return signedBytes;
	}
	
}
