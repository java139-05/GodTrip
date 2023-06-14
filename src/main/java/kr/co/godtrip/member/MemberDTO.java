package kr.co.godtrip.member;

public class MemberDTO {
	private String p_ID;
	private String p_passwd;
	private String p_name;
	private String p_tel;
	private String p_email;
	private String p_info;
	private String p_grade;
	private String p_category;
	
	public String getP_ID() {
		return p_ID;
	}
	public void setP_ID(String p_ID) {
		this.p_ID = p_ID;
	}
	public String getP_passwd() {
		return p_passwd;
	}
	public void setP_passwd(String p_passwd) {
		this.p_passwd = p_passwd;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_tel() {
		return p_tel;
	}
	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}
	public String getP_email() {
		return p_email;
	}
	public void setP_email(String p_email) {
		this.p_email = p_email;
	}
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	public String getP_grade() {
		return p_grade;
	}
	public void setP_grade(String p_grade) {
		this.p_grade = p_grade;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	@Override
	public String toString() {
		return "MemberDTO [p_ID=" + p_ID + ", p_passwd=" + p_passwd + ", p_name=" + p_name + ", p_tel=" + p_tel
				+ ", p_email=" + p_email + ", p_info=" + p_info + ", p_grade=" + p_grade + ", p_category=" + p_category
				+ "]";
	}

	
	
}
