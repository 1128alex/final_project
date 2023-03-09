package com.univ.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// Where the files will be saved
	// Home
	// public static final String FILE_UPLOAD_PATH =
	// "C:\\Users\\이지원\\Documents\\CS\\Final_Project\\Univ_Project\\workspace\\images/";

	// Camp
	// public static final String FILE_UPLOAD_PATH =
	// "D:\\이지원\\7_final_project\\UnivProject\\workspace\\images/";

	// aws
	public static final String FILE_UPLOAD_PATH = "/home/ec2-user/images/";

	public String saveFile(String email, MultipartFile file) {
		String directoryName = email + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;

		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			return null;
		}

		// file upload: in bytes
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename().replace(" ", "_"));
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		// http://localhost/images/aaaa_1630213213/sun.png
		return "/images/" + directoryName + file.getOriginalFilename().replace(" ", "_");
	}

	public void deleteFile(String filePath) { // filePath
		Path path = Paths.get(FILE_UPLOAD_PATH + filePath.replace("/images/", ""));
		if (Files.exists(path)) {
			// delete file
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("[Image delete] Failed to delete image. imagePath:{}", filePath);
			}
			// delete directory folder
			path = path.getParent();
			if (Files.exists(path)) {
				try {
					Files.delete(path);
				} catch (IOException e) {
					logger.error("[Image delete] Failed to delete directory folder. imagePath:{}", filePath);
				}
			}
		}
	}
}
