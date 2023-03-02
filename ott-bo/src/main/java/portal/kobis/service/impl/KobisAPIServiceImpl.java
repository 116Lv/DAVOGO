package portal.kobis.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.extern.slf4j.Slf4j;
import portal.common.util.DateUtil;
import portal.kobis.mapper.KobisMapper;
import portal.kobis.service.KobisAPIService;

@Slf4j
@Service
public class KobisAPIServiceImpl implements KobisAPIService {

	@Bean
	public KobisOpenAPIRestService getKobisService() {
		return new KobisOpenAPIRestService(apiKey);
	}
	
	@Autowired
	private KobisMapper kobisMapper;
	
	@Value("${app.kobis.api-key}")
	private String apiKey;

	@Value("${app.kobis.item-per-page}")
	private String itemPerPage;
	
	@Override
	public void saveDailyMovieList() {
		try {
			
			KobisOpenAPIRestService service = this.getKobisService();
			
			String dailyResponse = service.getDailyBoxOffice(true, DateUtil.getYesterday(), itemPerPage, "", "", "");
		
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
//			for(Entry<String, Object> entry : dailyResult.entrySet()) {
//				log.debug("key = "+entry.getKey()+" / value = "+entry.getValue());
//			}
			
			//일별박스오피스 결과
			Map<String, Object> boxOfficeResult = (Map<String, Object>) dailyResult.get("boxOfficeResult");
			
			//영화 목록
			List<Map<String, Object>> dailyBoxOfficeList = (List<Map<String, Object>>) boxOfficeResult.get("dailyBoxOfficeList");
			
			List<Map<String, Object>> actors = null;
			
			for (Map<String, Object> item : dailyBoxOfficeList) {
				log.debug("rank={}", item.get("rank"));
				log.debug("movieCd={}", item.get("movieCd"));
				log.debug("movieNm={}", item.get("movieNm"));
				log.debug("openDt={}", item.get("openDt"));
				log.debug("audiAcc={}", item.get("audiAcc"));
				
				Map<String, Object> movieInfo = this.getMovieInfo((String) item.get("movieCd"));
				
				int cnt = kobisMapper.checkMediaData((String) item.get("movieCd"));
				
				if (movieInfo != null) {
					movieInfo.putAll(item);
					
					if(cnt == 0) {
						
						//제작사, 배급사 문자열 만들기
						StringBuffer producer = new StringBuffer();
						StringBuffer distributor = new StringBuffer();
						List<Map<String,Object>> companies = (List<Map<String,Object>>) movieInfo.get("companys");
						if (companies != null && !companies.isEmpty()) {
							for (Map<String, Object> company : companies) {
								if ("제작사".equals(company.get("companyPartNm"))) {
									producer.append(company.get("companyNm")).append("^");
								} else if ("배급사".equals(company.get("companyPartNm"))) {
									distributor.append(company.get("companyNm")).append("^");
								}
							}
						}
						movieInfo.put("producer", producer.toString());
						movieInfo.put("distributor", distributor.toString());
						
						kobisMapper.insertDailyBoxOffice(movieInfo);
					}else {
						kobisMapper.updateDailyBoxOffice(movieInfo);
					}
					
				}
			}
			
		} catch (OpenAPIFault e) {
			log.error("api 호출 오류", e);
		} catch (Exception e) {
			log.error("예외 발생", e);
		}
		
	}

	@Override
	public void saveWeeklyMovieList() {
		
		try {
			
			KobisOpenAPIRestService service = this.getKobisService();
			
			String weeklyResponse;
			weeklyResponse = service.getWeeklyBoxOffice(true, DateUtil.getYesterday(), itemPerPage, "0", "", "", "");
		
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String,Object> weeklyResult = mapper.readValue(weeklyResponse, HashMap.class);
			
			for(Entry<String, Object> entry : weeklyResult.entrySet()) {
				log.debug("key = "+entry.getKey()+" / value = "+entry.getValue());
			}
			
			log.debug("===========");
			
		} catch (OpenAPIFault e) {
			log.error("api 호출 오류", e);
		} catch (Exception e) {
			log.error("예외 발생", e);
		}
		
	}
	
	/**
	 * 공통코드 저장
	 * @param codeGroup
	 */
	private void saveComCodeList(String codeGroup) throws Exception {
		
		KobisOpenAPIRestService service = this.getKobisService();
		
		//지역코드정보 조회
		String codeResponse = service.getComCodeList(true,"0105000000");
		
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
		
		for(Entry<String, Object> entry : codeResult.entrySet()) {
			log.debug("key = "+entry.getKey()+" / value = "+entry.getValue());
		}

	}
	
	private Map<String, Object> getMovieInfo(String movieCd) {
		
		try {
			
			KobisOpenAPIRestService service = this.getKobisService();
			
			String movieInfoResponse = service.getMovieInfo(true, movieCd);
		
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> movieResult = mapper.readValue(movieInfoResponse, HashMap.class);
//			for(Entry<String, Object> entry : movieInfoResult.entrySet()) {
//				log.debug("key = "+entry.getKey()+" / value = "+entry.getValue());
//			}
			
			//일별박스오피스 결과
			Map<String, Object> movieInfoResult = (Map<String, Object>) movieResult.get("movieInfoResult");
			
			//영화 목록
			return (Map<String, Object>) movieInfoResult.get("movieInfo");
			
		} catch (OpenAPIFault e) {
			log.error("api 호출 오류", e);
		} catch (Exception e) {
			log.error("예외 발생", e);
		}
		
		return null;
	}
}
