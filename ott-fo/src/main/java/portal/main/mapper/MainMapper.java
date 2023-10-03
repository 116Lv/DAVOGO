package portal.main.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MainMapper {

	public List<Map> getCategoryList();

	public List<Map> getContentsList(Map map);
}
