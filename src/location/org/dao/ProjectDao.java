package location.org.dao;

import java.util.List;

public interface ProjectDao {
	void insertProject(Project pro);
	Project findProjectName(String  pro_name);
	List<Project> findProject(int u_id);
}
