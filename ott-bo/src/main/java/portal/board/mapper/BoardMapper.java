package portal.board.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface BoardMapper {

	public List<Map<String, Object>> findBoardList(Map<String, Object> params);

	public int getCountOfBoardList(Map<String, Object> params);

	public Map<String, String> getBoardInfo(String id);

	public void insertSaveInfo(Map<String, String> params);

	public void updateSaveInfo(Map<String, String> params);

	public String getWriterInfo(String id);

}
