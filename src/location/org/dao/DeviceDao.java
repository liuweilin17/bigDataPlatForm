package location.org.dao;

import java.util.List;

public interface DeviceDao {
	void insertDevice(Device dev);
	boolean findDeviceName(String  dev_name);
	List<Device> findDevice(int pro_id);
}
