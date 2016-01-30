package location.org.dao;

import java.util.List;

public interface BasedataDao {
	void insertBasedata(Basedata bd);
	boolean findBasedata(Basedata bd);
	List<Basedata> findBasedata(double bl_id);
	void deleteBasedata(double bl_id);
}
