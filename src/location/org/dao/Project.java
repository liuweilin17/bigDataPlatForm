package location.org.dao;

public class Project {
	private int pro_id;
	private String pro_name;
	private String info;
	public Project(int pro_id, String pro_name, String info) {
		super();
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.info = info;
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
}
