package location.org.api;

public class ParseLonLat {
	public double parseToDouble(String s){
		double ret = 0;
		char c = s.charAt(s.length()-1);
		s = s.substring(0, s.length()-1);
		String[] sArray = s.split(":");
		//��γ�� ��ʽΪ �ȣ��֣���
		//����ת��Ϊ��
		ret += Double.valueOf(sArray[0]) * 3600;
		ret += Double.valueOf(sArray[1]) * 60;
		ret += Double.valueOf(sArray[2]);
		//��γΪ����������Ϊ����
		if(c == 'S' || c == 'W'){
			ret = -ret;
		}
		return ret;
	}
}
