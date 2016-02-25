package location.org.dao;

public class Basedata {
	private double bd_id;
	private double bl_id;
	private String b_time;
	private double b_prec;
	private String b_lat;
	private String b_lon;
	private double b_x;
	private double b_y;
	private double b_z;
	public Basedata(double bd_id, double bl_id, String b_time, double b_prec, String b_lat, String b_lon,
			double b_x, double b_y, double b_z) {
		super();
		this.bd_id = bd_id;
		this.bl_id = bl_id;
		this.b_time = b_time;
		this.b_prec = b_prec;
		this.b_lat = b_lat;
		this.b_lon = b_lon;
		this.b_x = b_x;
		this.b_y = b_y;
		this.b_z = b_z;
	}
	public double getBd_id() {
		return bd_id;
	}
	public void setBd_id(double bd_id) {
		this.bd_id = bd_id;
	}
	public double getBl_id() {
		return bl_id;
	}
	public void setBl_id(double bl_id) {
		this.bl_id = bl_id;
	}
	public String getB_time() {
		return b_time;
	}
	public void setB_time(String b_time) {
		this.b_time = b_time;
	}
	public double getB_prec() {
		return b_prec;
	}
	public void setB_prec(double b_prec) {
		this.b_prec = b_prec;
	}
	public String getB_lat() {
		return b_lat;
	}
	public void setB_lat(String b_lat) {
		this.b_lat = b_lat;
	}
	public String getB_lon() {
		return b_lon;
	}
	public void setB_lon(String b_lon) {
		this.b_lon = b_lon;
	}
	public double getB_x() {
		return b_x;
	}
	public void setB_x(double b_x) {
		this.b_x = b_x;
	}
	public double getB_y() {
		return b_y;
	}
	public void setB_y(double b_y) {
		this.b_y = b_y;
	}
	public double getB_z() {
		return b_z;
	}
	public void setB_z(double b_z) {
		this.b_z = b_z;
	}
	
}
