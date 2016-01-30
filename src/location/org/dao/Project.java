package location.org.dao;

public class Project {
	private int pro_id;
	private String pro_name;
	private String info;
	private String u_name;
	public Project(int pro_id, String pro_name, String info, String u_name) {
		super();
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.info = info;
		this.setU_name(u_name);
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
}
