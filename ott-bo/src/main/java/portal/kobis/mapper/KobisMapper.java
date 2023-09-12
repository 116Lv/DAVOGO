package portal.kobis.mapper;

import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface KobisMapper {
	public int checkMediaData(String mediaCd);
	
	public void insertDailyBoxOffice(Map<String, Object> movieInfo);

	public void updateDailyBoxOffice(Map<String, Object> movieInfo);

}
