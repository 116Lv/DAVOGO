package portal.banner.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import portal.banner.mapper.BannerMapper;
import portal.banner.service.BannerService;

@Service
public class BannerServiceImpl implements BannerService {
	
	@Autowired
	private BannerMapper bannerMapper;

	@Override
	public List<Map<String, Object>> findBannerList(Map<String, Object> params) {
		return bannerMapper.findBannerList(params);
	}

	@Override
	public int getCountOfBannerList(Map<String, Object> params) {
		return bannerMapper.getCountOfBannerList(params);
	}

	@Override
	public Map<String, Object> getBannerInfo(String id) {
		return bannerMapper.getBannerInfo(id);
	}

	@Override
	public List<Map<String, Object>> getFileList(Map<String, String> searchParam) {
		return bannerMapper.getFileList(searchParam);
	}

	@Override
	public void saveInfo(Map<String, String> params, List<MultipartFile> bannerFileList) {
		if(StringUtils.isBlank(params.get("banner_id")) ) {
			bannerMapper.insertSaveInfo(params);
		}else {
			bannerMapper.updateSaveInfo(params);
		}
	}

}
