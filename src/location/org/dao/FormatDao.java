package location.org.dao;

import java.util.List;

public interface FormatDao {
	boolean insertFormat(Format form);
	boolean deleteFormat(int for_id);
	//boolean findDeviceById(int for_id);
	List<Format> findFormat(int pro_id);
	Format findFormatById(int for_id);
	Format findFormatByNameProject(String for_name,int pro_id);
	String findTypeByName(int for_id,String name);
}
