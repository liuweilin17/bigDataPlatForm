package location.org.dao;

import java.util.List;

public interface BaselineDao {
	void insertBaseline(Baseline bl);
	double findBaseline(Baseline b1);
	List<Baseline> findBaseline(String username);
}
