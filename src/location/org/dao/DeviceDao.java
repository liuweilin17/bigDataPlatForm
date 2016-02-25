package location.org.dao;

import java.util.List;

public interface DeviceDao {
	boolean insertDevice(Device dev);
	boolean deleteDevice(int dev_id);
	Device findDeviceName(int pro_id, String dev_name);
	Device findDeviceById(int dev_id);
	List<Device> findDevice(int pro_id);
	String findDeviceData(String table_name,int dev_id,String[] for_name_array,String[] for_type_array);
	String findChartData(String table_name,int dev_id,String name);
	String findTypeByName(int dev_id,String name);
}
