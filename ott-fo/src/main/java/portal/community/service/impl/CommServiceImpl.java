package portal.community.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import portal.common.util.DateUtil;
import portal.common.util.FileUtil;
import portal.community.mapper.CommMapper;
import portal.community.service.CommService;

@Service
public class CommServiceImpl implements CommService{
	
	@Value("${file.storePath}")
    private String fileStorePath;
	
	@Autowired
	private CommMapper commMapper;

	@Override
	public List<Map> getCommunityList(Map params) {
		
		List<Map> list = commMapper.getCommunityList(params);
		
		for (Map map : list) {
			Integer commDiv = (Integer) map.get("commDiv");
			
			map.put("loginEmailId", params.get("loginEmailId"));
			//투표
			if (commDiv == 1) {
				map.put("items", commMapper.getVoteItems(map));
				
			//월드컵
			} else if (commDiv == 2) {
				map.put("items", commMapper.getWorldImages(map));
			}
			
		}
		
		return list;
	}

	@Override
	public void saveVote(Map params) {
		
		commMapper.saveVote(params);
		
		if(params.containsKey("items") && params.get("items") != null) {
			String[] items = (String[]) params.get("items");
			for(String item : items) {
				params.put("item", item);
				commMapper.saveVoteItem(params);
			}
			
		}
	}

	@Override
	public void saveVoteClick(Map params) {
		
		Map beforeVoteInfo = commMapper.getUserVoteInfo(params);
		
		//이전에 클릭한 정보가 없으면 
		if (beforeVoteInfo == null || beforeVoteInfo.isEmpty()) {
			//사용자 투표정보 insert 및 투표 수량 plus
			commMapper.insertVoteUser(params);
			
			params.put("action", "vote");
			commMapper.saveVoteClick(params);
			
		//이전에 클릭한 정보가 있으면
		} else {	
			Integer beforeVoteId = (Integer) beforeVoteInfo.get("voteId");
			Integer voteId = Integer.parseInt((String) params.get("voteId"));
			
			//클릭했던 정보가 현재 클릭한 번호와 동일할 경우
			if (beforeVoteId == voteId) {
				//클랙했던 사용자 투표정보 삭제 및 투표 수량 minus
				commMapper.deleteVoteUser(params);
				
				params.put("action", "cancel");
				commMapper.saveVoteClick(params);
			
			//클릭한 투표 정보를 변경한 경우
			} else {
				//클릭했던 사용자의 투표정보 업데이트
				params.put("beforeVoteId", beforeVoteId);
				commMapper.updateVoteUser(params);
				
				//새로 선택한 투표수량은 plus
				params.put("action", "vote");
				commMapper.saveVoteClick(params);
				
				//이전 투표한 수량은 minus
				beforeVoteInfo.put("action", "cancel");
				commMapper.saveVoteClick(beforeVoteInfo);
			}
			
		}
	}

	@Override
	public List<Map> getVoteItems(Map params) {
		return commMapper.getVoteItems(params);
	}
	
	@Override
	public void saveComment(Map params) {
		commMapper.saveComment(params);
	}

	@Override
	public void deleteComment(Map params) {
		commMapper.deleteComment(params);
	}

	@Override
	public List<Map> getCommentList(Map params) {
		return commMapper.getCommentList(params);
	}

	@Override
	public int getCommentCnt() {
		return commMapper.getCommentCnt();
	}

	@Override
	public void saveLike(Map params) {
		
		//사용자가 이전에 좋아요 또는 싫어요를 한 데이터가 있는지 조회
		String userLikeType = commMapper.getCommLike(params);
		
		//이전에 좋든 싫든을 한적이 없으면 insert
		if (userLikeType == null) {
			commMapper.insertCommLike(params);
		} else {
			
			//이미 좋아요/싫어요를 한 후, 다시 동일한 버튼을 누르는 경우 데이터 삭제.
			if (userLikeType.equals((String)params.get("likeType"))) {
				commMapper.deleteCommLike(params);
				//-1
			} else {
				commMapper.updateCommLike(params);
				//+1 or -1
			}
		}
		
		commMapper.updateCommunityForLike(params);
		
	}

	@Override
	public void insertWorldInfo(Map params) {
		commMapper.insertWorldInfo(params);
	}

	@Override
	public void insertWorldImage(Map params, MultipartFile file) throws Exception{
		
		String orgFileName = file.getOriginalFilename();
		
		String fileExt = orgFileName.substring(orgFileName.lastIndexOf(".") + 1).toLowerCase();
		
		String prefixFileName = DateUtil.getCurrentDate(DateUtil.YMDHMSS);
		
		String savePath = "community/world/";
		
		String fullPath = fileStorePath + savePath + params.get("comm_id");
		
		String fileName = prefixFileName + "." + fileExt;
		
		String fullFileName = fullPath + FileUtil.separator + fileName;
		
		FileUtil.uploadFile(file, fullPath, fileName);
		
		String thumbFileName = prefixFileName + "_thumb." + fileExt;
		
		String thumbFullFileName = fullPath + FileUtil.separator + thumbFileName;
		
		try {
			FileUtil.createThumbnail(fullFileName, thumbFullFileName, 400);
		} catch (Exception e) {
			thumbFileName = fileName;
		}
		params.put("fullPath", fullPath);
		params.put("fname", fileName);
		params.put("tname", thumbFileName);
		params.put("orgFile", orgFileName);
		
		commMapper.insertWorldImage(params);
	}

	@Override
	public void insertWorld(Map params) {
		commMapper.insertWorld(params);	
	}

	@Override
	public List<Map> getWorldImageList(Map params) {
		return commMapper.getWorldImageList(params);
	}

	@Override
	public int getWorldImageCount(Map params) {
		return commMapper.getWorldImageCount(params);
	}

	@Override
	public List<Integer> getWorldImageId(Map params) {
		return commMapper.getWorldImageId(params);
	}

	@Override
	public Map getWorldImageInfo(Map params) {
		return commMapper.getWorldImageInfo(params);
	}

	@Override
	public Map getWorldInfo(Map params) {
		return commMapper.getWorldInfo(params);
	}

	@Override
	public void saveResult(Map params) {
		commMapper.saveResult(params);
	}

	@Override
	public void saveResultUserInfo(Map params) {
		commMapper.saveResultUserInfo(params);
	}
	
}
