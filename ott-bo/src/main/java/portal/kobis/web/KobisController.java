package portal.kobis.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import lombok.extern.slf4j.Slf4j;
import portal.kobis.service.KobisAPIService;

@Slf4j
@Controller
public class KobisController {

	@Autowired
	private KobisAPIService kobisAPIService;
	
	@Scheduled(cron="0 0 0 * * *")
	public void scheduleDailyMovieList() {
		try {
			this.saveDailyMovieList();
		} catch (Exception e) {
			log.error("일별 영화 목록 스케쥴 처리 오류", e);
		}
	}
	
	@RequestMapping("/movie/daily.do")
	@ResponseStatus(HttpStatus.OK)
	public void saveDailyMovieList() throws Exception {
		
		kobisAPIService.saveDailyMovieList();
		
	}
	
	@Scheduled(cron="0 30 0 * * 1")
	public void scheduleWeeklyMovieList() {
		try {
			this.saveWeeklyMovieList();
		} catch (Exception e) {
			log.error("주간 영화 목록 스케쥴 처리 오류", e);
		}
	}
	
	@RequestMapping("/movie/weekly.do")
	@ResponseStatus(HttpStatus.OK)
	public void saveWeeklyMovieList() throws Exception {
		
		kobisAPIService.saveWeeklyMovieList();
		
	}
}
