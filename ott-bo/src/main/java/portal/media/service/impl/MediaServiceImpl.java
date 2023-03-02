package portal.media.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ibatis.common.logging.Log;

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

	
}
