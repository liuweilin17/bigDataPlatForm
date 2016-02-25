package location.org.dao;

public class Format {
	int for_id;
	String for_name;
	String for_typelist;
	String for_namelist;
	int pro_id;
	public Format(int for_id, String for_name, String for_typelist, String for_namelist, int pro_id) {
		super();
		this.for_id = for_id;
		this.for_name = for_name;
		this.for_typelist = for_typelist;
		this.for_namelist = for_namelist;
		this.pro_id = pro_id;
	}
	public String getFor_name() {
		return for_name;
	}
	public void setFor_name(String for_name) {
		this.for_name = for_name;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getFor_id() {
		return for_id;
	}
	public void setFor_id(int for_id) {
		this.for_id = for_id;
	}
	public String getFor_typelist() {
		return for_typelist;
	}
	public void setFor_typelist(String for_typelist) {
		this.for_typelist = for_typelist;
	}
	public String getFor_namelist() {
		return for_namelist;
	}
	public void setFor_namelist(String for_namelist) {
		this.for_namelist = for_namelist;
	}
}
