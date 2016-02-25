package location.org.dao;

public class Baseline {
	private double bl_id;
	private String m_name;
	private String r_name;
	private String u_name;
	public Baseline(double bl_id, String m_name, String r_name, String u_name) {
		super();
		this.bl_id = bl_id;
		this.m_name = m_name;
		this.r_name = r_name;
		this.u_name = u_name;
	}
	public double getBl_id() {
		return bl_id;
	}
	public void setBl_id(double bl_id) {
		this.bl_id = bl_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	
}
