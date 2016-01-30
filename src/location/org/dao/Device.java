package location.org.dao;

public class Device {
	int dev_id;
	String dev_name;
	int pro_id;
	int for_id;
	public Device(int dev_id, String dev_name, int pro_id, int for_id) {
		super();
		this.dev_id = dev_id;
		this.dev_name = dev_name;
		this.pro_id = pro_id;
		this.for_id = for_id;
	}
	public int getDev_id() {
		return dev_id;
	}
	public void setDev_id(int dev_id) {
		this.dev_id = dev_id;
	}
	public String getDev_name() {
		return dev_name;
	}
	public void setDev_name(String dev_name) {
		this.dev_name = dev_name;
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
	
}
