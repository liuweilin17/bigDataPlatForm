package location.org.dao;

public interface UserDao {
	void insertUser(User user);
	void deleteUser(int id);
	//void findUserById(int id);
	//void findUserByName(int name);
	User findUser(String username, String password);
	boolean findUsername(String username);
	//List<User> getAllUses(String[] params);
}
