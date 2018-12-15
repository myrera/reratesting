package in.gov.rera.common.util;



public class TecPaginator {
	public int SHOW_ROWS ;
	private final int size;
	private int startWith;
	private int index;
    private String pagginationData;
    
	public TecPaginator(int totalRecards,int maxRecords,int startIndex) {

		this.size = totalRecards;
		this.SHOW_ROWS = maxRecords;
		startWith=startIndex;
	}


	public String getPagginationData() {
		
		StringBuffer sb = new StringBuffer();
		if (size > SHOW_ROWS) {
			int max=startWith+SHOW_ROWS; 
			if(max>size) max=size;
			sb.append("<ul class='pagination'>");
			if (startWith > 0){
				sb.append("<li><a href='javascript:pagging(" + (startWith - SHOW_ROWS)+")'>&laquo;</a></li>");
			
			}
			else
				sb.append("<li class='disabled'><a href='javascript:void()'>&laquo;</a></li>");
			int x = 0;
			int y = 1;
		
			if(size<=5*SHOW_ROWS)
			{
			while (x < size) {
				
				if(x!=startWith){
					
					sb.append("<li><a href='javascript:pagging(" +x+")'>"+y+"</a></li>");
				
				y++;
				}
				else{
					sb.append("<li  class='active'><a href='javascript:void()'>"+y+"</a></li>");
					y++;
				}
				
				x += SHOW_ROWS;
			}
			}else{
				int page=(startWith/SHOW_ROWS)+1;
				int tot=size/SHOW_ROWS;
				int ab=size%SHOW_ROWS;
				
				int fr=2;
				if(page<3)
					fr=5-page;
				if(ab>0)
					tot+=1;
				int end=page+fr;
				if(end>tot)
					end=tot;
				y=end-4;
				x=(y-1)*SHOW_ROWS;
				while (x < size&& y<=end) {					
					
					if(x!=startWith){
						sb.append("<li><a href='javascript:pagging(" +x+")'>"+y+"</a></li>");
					y++;
					}
					else{
						sb.append("<li class='active'><a  href='javascript:void()'>"+y+"</a></li>");
						y++;
					}
					
					x += SHOW_ROWS;
				}
			}
			if (index < size){
				sb.append("<li><a href='javascript:pagging(" + (startWith + SHOW_ROWS)+")'>&raquo;</a></li>");
				
			}
			else
			{sb.append("<li class='disable'><a href='javascript:void()'>&raquo;</a></li>");}
			sb.append("</ul>");
		}
		return sb.toString();
		}
	
	
	
}
