package location.org.dao;

public class User {
		private double u_id;
		private String u_name;
		private String u_password;
		private int u_identity;
		public User(String username,String password,int u_identity){
			this.u_name = username;
			this.u_password = password;
			this.u_identity = u_identity;
		}
		public User(double u_id, String u_name, String u_password, int u_identity) {
			super();
			this.u_id = u_id;
			this.u_name = u_name;
			this.u_password = u_password;
			this.u_identity = u_identity;
		}
		public int getU_identity() {
			return u_identity;
		}
		public void setU_identity(int u_identity) {
			this.u_identity = u_identity;
		}
		public double getU_id() {
			return u_id;
		}
		public void setU_id(double u_id) {
			this.u_id = u_id;
		}
		public String getU_name() {
			return u_name;
		}
		public void setU_name(String u_name) {
			this.u_name = u_name;
		}
		public String getU_password() {
			return u_password;
		}
		public void setU_password(String u_password) {
			this.u_password = u_password;
		}
}
