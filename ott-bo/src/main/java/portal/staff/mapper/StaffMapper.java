package portal.staff.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import portal.staff.vo.StaffVO;

@Mapper
public interface StaffMapper {

	public List<Map<String, Object>> findStaffList(Map<String, Object> params);

	public int getCountOfStaffList(Map<String, Object> params);

	public StaffVO getStaffInfo(StaffVO staffVO);

	public void insertSaveInfo(Map<String, String> params);

	public void updateSaveInfo(Map<String, String> params);

	public Map<String, Object> getStafInfo(String id);

}
