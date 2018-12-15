package in.gov.rera.dms.beans;

import java.io.InputStream;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.util.HtmlUtils;

import in.gov.rera.common.util.DocumentEncryptor;

@Entity(name = "Document")
@Table(name = "TT_DOCUMENT")
public class Document implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 555667681L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DOC_ID")
	private Integer documentId;

	@Column(name = "FOLDER_ID")
	private String folderId;

	@Transient
	private InputStream inputStream;

	@Column(name = "FILE_NAME", length = 250)
	private String fileName;

	@Column(name = "CAPTION", length = 250)
	private String caption;

	@Column(name = "MIME_TYPE", length = 500)
	private String mimeType;

	@Column(name = "DOC_NAME", length = 150)
	private String documentName;

	@Column(name = "DOC_TYPE", length = 150)
	private String documentType;

	public String getFolderId() {
		return folderId;
	}

	public void setFolderId(String folderId) {
		this.folderId = folderId;
	}

	public int getDocumentId() {
		return documentId;
	}

	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}

	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public void setDocumentId(Integer documentId) {
		this.documentId = documentId;
	}

	public String getDocId() throws UnsupportedEncodingException {
		return URLEncoder.encode(DocumentEncryptor.encrypt(documentId.toString()),java.nio.charset.StandardCharsets.UTF_8.toString());
	}

}
