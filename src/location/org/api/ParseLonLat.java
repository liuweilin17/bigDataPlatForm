package location.org.api;

public class ParseLonLat {
	public double parseToDouble(String s){
		double ret = 0;
		char c = s.charAt(s.length()-1);
		s = s.substring(0, s.length()-1);
		String[] sArray = s.split(":");
		//经纬度 格式为 度：分：秒
		//将其转化为秒
		ret += Double.valueOf(sArray[0]) * 3600;
		ret += Double.valueOf(sArray[1]) * 60;
		ret += Double.valueOf(sArray[2]);
		//南纬为负数，西经为负数
		if(c == 'S' || c == 'W'){
			ret = -ret;
		}
		return ret;
	}
}
