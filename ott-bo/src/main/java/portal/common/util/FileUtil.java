/**
 * 
 */
package portal.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.MultiStepRescaleOp;

/**
 * 파일 관련 util
 * @author USER
 *
 */
public class FileUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);
	public static final String separator = "/";
	
	/**
	 * 저장할 경로 조회
	 * @param type 저장할 파일 유형명
	 * @param key 유형에 대한 key값
	 * @return
	 */
	public static String getPathToSave(String type, String key) {
		long idValue = Long.valueOf(key);
		idValue = (idValue / 100) * 100;
		String idFolder = (idValue == 0)? "000" : Long.toString(idValue);
		
		StringBuilder dirPath = new StringBuilder().append(type).append(FileUtil.separator)
								.append(idFolder).append(FileUtil.separator).append(key);
		
		return dirPath.toString();
	}
	
	/**
	 * tif 파일 저장
	 * @param file
	 * @param targetFullPath
	 * @param targetFileName
	 * @return
	 * @throws Exception
	 */
//	public static String uploadTifFile(MultipartFile file, String targetFullPath, String targetFileName) throws Exception {
//		
//		String fullFileName = targetFullPath + FileUtil.separator + targetFileName;
//		
//		//디렉토리 생성
//		File directory = new File(targetFullPath);
//		if(!directory.exists()){ 
//			directory.mkdirs();
//		}
//		
//		//기존파일이 있으면 삭제
//		File oldFile = new File(fullFileName);
//		if (oldFile.exists()) {
//			oldFile.delete();
//		}
//		
//		//파일저장
//		RenderedOp op = null;
//		BufferedImage im = null;
//		BufferedImage thumb = null;
//		String tifFullFileName = null;
//		
//		try {
//			//tmp에 저장됐던 input 파일을 특정 위치에 저장한 후, tif 변환 저장하고 나서 삭제.
//			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(fullFileName));
//			
//			op = JAI.create("fileload", fullFileName);
//	        im = op.getAsBufferedImage();
//	        
//	        thumb = new BufferedImage(im.getWidth(), im.getHeight(), BufferedImage.TYPE_INT_RGB);
//	        thumb.createGraphics().drawImage(im, 0, 0, im.getWidth(), im.getHeight(), null);
//	        
//	        tifFullFileName = fullFileName.replace(".tiff", ".jpg").replace(".tif", ".jpg");
//			ImageIO.write(thumb, "jpg", new File(tifFullFileName));
//			
//			logger.debug("삭제=" + fullFileName);
//			new File(fullFileName).delete();
//			
//			fullFileName = tifFullFileName;
//			
//		} catch (Exception e) {
//			logger.error("Tif 저장 오류", e);
//			e.printStackTrace();
//		} finally {
//			if (op != null)
//				op.dispose();
//			
//			if (im != null)
//				im.flush();
//			
//			if (thumb != null)
//				thumb.flush();
//		}
//		
//		return fullFileName;
//	}
	
	/**
	 * 파일 저장
	 * @param file 업로드된 Multipart파일 객체
	 * @param targetFullPath 저장할 경로 디렉토리
	 * @param targetFileName 저장할 파일명
	 * @return
	 * @throws Exception
	 */
	public static String uploadFile(MultipartFile file, String targetFullPath, String targetFileName) throws Exception {
		
		String fullFileName = targetFullPath + FileUtil.separator + targetFileName;
		
		//디렉토리 생성
		File directory = new File(targetFullPath);
		if(!directory.exists()){ 
			directory.mkdirs();
		}
		
		//기존파일이 있으면 삭제
		File oldFile = new File(fullFileName);
		if (oldFile.exists()) {
			oldFile.delete();
		}
		
		//파일저장
		FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(fullFileName));
		
		return fullFileName;
	}

	/**
	 * Tif 썸네일 생성
	 * @param sourceFile 원본 파일 경로
	 * @param targetFile
	 * @param width
	 * @return
	 * @throws Exception
	 */
//	public static void createTifThumbnail(String sourceFile, String targetFile, int width) throws Exception {
//
//		RenderedOp op = null;
//		BufferedImage im = null;
//		BufferedImage thumb = null;
//		
//		try {
//			op = JAI.create("fileload", sourceFile);
//	        im = op.getAsBufferedImage();
//	
//	        // Img Width, Height 가져오기
//			int imgWidth = im.getWidth();
//			int imgHeight = im.getHeight();
//	
//			int thumbWidth = 0;
//			int thumbHeight = 0;
//			
//			int[] thumbWH = imgWidthHeight(imgWidth, imgHeight, width);
//			
//			thumbWidth = thumbWH[0];
//			thumbHeight = thumbWH[1];
//	
//			thumb = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_INT_RGB);
//	        thumb.createGraphics().drawImage(im, 0, 0, thumbWidth, thumbHeight, null);
//	        
//			// write to jpg file
//			ImageIO.write(thumb, "jpg", new File(targetFile));
//			
//		} catch (Exception e) {
//			logger.error("Tif Thumbnail 생성 오류", e);
//			e.printStackTrace();
//			throw e;
//		} finally {
//			if (op != null)
//				op.dispose();
//			
//			if (im != null)
//				im.flush();
//			
//			if (thumb != null)
//				thumb.flush();
//		}
//		
//	}
	
	/**
	 * 썸네일 생성 - tif 제외
	 * @param sourceFile
	 * @param targetFile
	 * @param width
	 * @throws Exception
	 */
	public static void createThumbnail(String sourceFile, String targetFile, int width) throws Exception {
		
		BufferedImage im = null;
		BufferedImage thumbImage = null;
		
		try {
			im = ImageIO.read(new File(sourceFile));

			int[] thumbWH = imgWidthHeight(im.getWidth(), im.getHeight(), width);

			int thumbWidth = thumbWH[0];
			int thumbHeight = thumbWH[1];

			MultiStepRescaleOp rescale = new MultiStepRescaleOp(thumbWidth, thumbHeight);
			rescale.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.None);
			thumbImage = rescale.filter(im, null);
			
			ImageIO.write(thumbImage, FilenameUtils.getExtension(sourceFile), new File(targetFile));
			
		} catch (Exception e) {
			logger.error("Thumbnail 생성 오류", e);
			e.printStackTrace();
			throw e;
		} finally {
			im.flush();
			thumbImage.flush();
		}
	}
	
	/**
	 * ThumbNail Width, Height 계산
	 * @param width
	 * @param height
	 * @param thumbSize
	 * @return
	 * @throws Exception
	 */
	public static int[] imgWidthHeight(int width, int height, int thumbSize) throws Exception {

		//Return Array
		int[] imgWH = new int[2];

		//ThumbNail Width, Height
		int thumbWidth = width;
		int thumbHieght = height;

		// 너비가 더 클경우
		if(width >= height){
			//너비가 주어진 사이즈보다 클 경우
			if(width > thumbSize){
				thumbWidth = thumbSize;
				thumbHieght = height * thumbSize / width;
			}
		// 높이가 더 클경우
		}else{
			//높이가 주어진 사이즈보다 클 경우
			if(height > thumbSize){
				thumbHieght = thumbSize;
				thumbWidth = width * thumbSize / height;
			}
		}

		imgWH[0] = thumbWidth;
		imgWH[1] = thumbHieght;

		return imgWH;
	}
	
	/**
	 * 파일 삭제
	 * @param fullpath
	 * @return
	 */
	public static boolean deleteFile(String fullpath) {
		return deleteFile(new File(fullpath));
	}

	/**
	 * 파일(또는 경로) 삭제
	 * @param file
	 * @return
	 */
	public static boolean deleteFile(File file) {
		
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			for (File f : files) {
				deleteFile(f);
			}
		}
		return file.delete();
	}
	
}
