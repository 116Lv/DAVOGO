package portal.staff.service;

import java.util.List;
import java.util.Map;

import portal.staff.vo.StaffVO;

public interface StaffService {

	public List<Map<String, Object>> findStaffList(Map<String, Object> params);

	public int getCountOfStaffList(Map<String, Object> params);

	public StaffVO getStaffInfo(StaffVO staffVO);

	public Map<String, Object> getStaffInfo(String id);

	public void saveInfo(Map<String, String> params);
	
}
