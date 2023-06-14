package kr.co.godtrip.attraction;

public class AttractionDTO {

	private int tour_code;
	private String area_code;
	private String tour_name;
	private String content;
	private String filename;
	private int filesize;
	private String regdate;
	private int view_count;
	private int keyword;
	
	
	public  AttractionDTO() {}

	


	public int getTour_code() {
		return tour_code;
	}




	public void setTour_code(int tour_code) {
		this.tour_code = tour_code;
	}




	public String getArea_code() {
		return area_code;
	}


	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}


	public String getTour_name() {
		return tour_name;
	}


	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public int getFilesize() {
		return filesize;
	}


	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getView_count() {
		return view_count;
	}


	public void setView_count(int view_count) {
		this.view_count = view_count;
	}


	public int getKeyword() {
		return keyword;
	}


	public void setKeyword(int keyword) {
		this.keyword = keyword;
	}


	@Override
	public String toString() {
		return "AttractionDTO [tour_code=" + tour_code + ", area_code=" + area_code + ", tour_name=" + tour_name
				+ ", content=" + content + ", filename=" + filename + ", filesize=" + filesize + ", regdate=" + regdate
				+ ", view_count=" + view_count + ", keyword=" + keyword + "]";
	}
	
	
	
	
	
}//class end 
