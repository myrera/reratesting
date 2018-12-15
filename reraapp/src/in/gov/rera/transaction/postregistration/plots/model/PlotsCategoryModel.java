package in.gov.rera.transaction.postregistration.plots.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "PlotsCategoryModel")
@Table(name = "TT_PLOT_CATEGORY")
public class PlotsCategoryModel {
	
	private static final long serialVersionUID = 1L;


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CATEGORY_ID")
	private Long plotsCatId;

	 @Column(name="CAT_NAME")
	  private String catName;
	
	@Column(name="SIZE_OF_PLOT")
	  private Long sizeOfPlot;

	public Long getPlotsCatId() {
		return plotsCatId;
	}

	public void setPlotsCatId(Long plotsCatId) {
		this.plotsCatId = plotsCatId;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public Long getSizeOfPlot() {
		return sizeOfPlot;
	}

	public void setSizeOfPlot(Long sizeOfPlot) {
		this.sizeOfPlot = sizeOfPlot;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
