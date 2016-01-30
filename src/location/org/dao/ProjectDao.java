package location.org.dao;

import java.util.List;

public interface ProjectDao {
	void insertProject(Project pro);
	boolean findProjectName(String  pro_name);
	List<Project> findProject(String username);
}
