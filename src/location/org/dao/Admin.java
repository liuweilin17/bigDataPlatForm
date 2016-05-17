package location.org.dao;

public class Admin {
	private int adm_id;
	private int u_id;
	private int pro_id;
	private int role;
	public Admin(int adm_id, int u_id, int pro_id, int role) {
		super();
		this.adm_id = adm_id;
		this.u_id = u_id;
		this.pro_id = pro_id;
		this.role = role;
	}
	public int getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(int adm_id) {
		this.adm_id = adm_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
}
