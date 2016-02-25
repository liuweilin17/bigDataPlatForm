package location.org.dao;

public interface UserDao {
	void insertUser(User user);
	void deleteUser(int id);
	//void findUserById(int id);
	//void findUserByName(int name);
	boolean findUser(String username, String password, int role);
	boolean findUsername(String username);
	//List<User> getAllUses(String[] params);
}
