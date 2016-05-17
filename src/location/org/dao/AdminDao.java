package location.org.dao;

import java.util.List;

public interface AdminDao {
	List<Integer> findPro_idByU_id(int u_id);
	boolean insertAdmin(int u_id,int pro_id,int role);
	int findRole(int u_id,int pro_id);
}
