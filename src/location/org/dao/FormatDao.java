package location.org.dao;

import java.util.List;

public interface FormatDao {
	void insertFormat(Format form);
	//boolean findDeviceById(int for_id);
	List<Format> findFormat(int pro_id);
	Format findFormatById(int for_id);
}
