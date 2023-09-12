package portal.media.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.PumpStreamHandler;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import portal.media.mapper.MediaMapper;
import portal.media.service.FileService;
import portal.media.service.MediaService;

@Slf4j
@Service
public class MediaServiceImpl implements MediaService {
	
	@Autowired
	private MediaMapper mediaMapper;
	
	@Autowired
	private FileService fileService;
	
	@Override
	public List<Map<String, Object>> findMediaList(Map<String, Object> params) {
		return mediaMapper.findMediaList(params);
	}

	@Override
	public int getCountOfMediaList(Map<String, Object> params) {
		return mediaMapper.getCountOfMediaList(params);
	}

	@Override
	public void saveInfo(Map<String, String> params, List<MultipartFile> posterFileList, List<MultipartFile> adsFileList) throws Exception {
		
		if(StringUtils.isBlank(params.get("media_id")) ) {
			//insert
			mediaMapper.insertSaveInfo(params);
		}else{
			//update
			mediaMapper.updateSaveInfo(params);
		}
		
		//나중에 파일삭제 구현장소
		String deleteFileIds = params.get("deleteFileIds");
		if (StringUtils.isNotBlank(deleteFileIds)) {
			String[] fileIds = deleteFileIds.split(",");
			
			for (String fileId : fileIds) {
				
				if (StringUtils.isBlank(fileId))
					continue;
				
				//fildId별로 물리적 파일 삭제 및 db data 삭제
				try {
					fileService.deleteFile(fileId);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//poster insert
		fileService.fileUpload(posterFileList, params.get("media_divnm")+"/poster/", params.get("media_id"), "poster");
		
		//ads insert
		fileService.fileUpload(adsFileList, "movie/ads/", params.get("media_id"), "ads");
	}

	@Override
	public Map<String, Object> getMediaInfo(String id) {
		return mediaMapper.getMediaInfo(id);
	}
	
	@Override
	public void pullTvData() throws Exception {
		log.debug("Python Call");
		
        List<String> fileNames = new ArrayList<String>();
        fileNames.add("C:/Users/lbw01/Desktop/OTT/tvMain.py");
        fileNames.add("C:/Users/lbw01/Desktop/OTT/tvInfo.py");
        fileNames.add("C:/Users/lbw01/Desktop/OTT/tvExtraInfo.py");
        fileNames.add("C:/Users/lbw01/Desktop/OTT/tvActorInfo.py");
        int i=1;
        ByteArrayOutputStream outputStream = null;
        
    	for (String fileName : fileNames) {
        	CommandLine commandLine = CommandLine.parse("python");
            commandLine.addArgument(fileName);

            try {
	            outputStream = new ByteArrayOutputStream();
	            PumpStreamHandler pumpStreamHandler = new PumpStreamHandler(outputStream);
	            DefaultExecutor executor = new DefaultExecutor();
	            executor.setStreamHandler(pumpStreamHandler);
	            int result;
					result = executor.execute(commandLine);
	            log.debug("result: " + result);
	            log.debug("output: " + outputStream.toString("UTF-8"));
            
            } catch (IOException e) {
            	e.printStackTrace();
            } finally {
            	if(outputStream != null) {
            		outputStream.close();
            	}
            }
            log.debug(i+"단계통과");
            i++;
    	}
	}

	
}
