package portal.staff.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.staff.mapper.StaffMapper;
import portal.staff.service.StaffService;
import portal.staff.vo.StaffVO;

@Service
public class StaffServiceImpl implements StaffService {
	
	@Autowired
	private StaffMapper staffMapper;

	@Override
	public List<Map<String, Object>> findStaffList(Map<String, Object> params) {
		return staffMapper.findStaffList(params);
	}

	@Override
	public int getCountOfStaffList(Map<String, Object> params) {
		return staffMapper.getCountOfStaffList(params);
	}
	
	public StaffVO getStaffInfo(StaffVO staffVO) {
		return staffMapper.getStaffInfo(staffVO);
	}

	@Override
	public Map<String, Object> getStaffInfo(String id) {
		return staffMapper.getStafInfo(id);
	}

	@Override
	public void saveInfo(Map<String, String> params) {
		if(StringUtils.isBlank(params.get("staff_id")) ) {
			//insert
			staffMapper.insertSaveInfo(params);
		}else{
			//update
			staffMapper.updateSaveInfo(params);
		}
	}
}
