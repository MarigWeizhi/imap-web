package com.imap.common.util.upload;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;

public class FileUploadUtils {

	/**
	 * 获取多组数据
	 * 参数名:组号
	 * */
	public static List<Map<String, String>> getUploadMapList(HttpServletRequest request, String imgParentUrl) {
		List<Map<String, String>> mapList = new ArrayList<>();

		int curIndex = -1;
		DiskFileItemFactory dfif = new DiskFileItemFactory();
		// 设置临时文件存储位置
		dfif.setRepository(new File(request.getServletContext().getRealPath(
				"/temp")));
		// 设置上传文件缓存大小为10m
		dfif.setSizeThreshold(1024 * 1024 * 10);
		// 创建上传组件
		ServletFileUpload upload = new ServletFileUpload(dfif);
		// 处理上传文件中文乱码
		upload.setHeaderEncoding("utf-8");

		try {
			// 解析request得到所有的FileItem（文件和键值对）
			List<FileItem> items = upload.parseRequest(request);
			System.out.println("items"+items);
			// 遍历所有FileItem
			System.out.println("多文件测试");
			for (FileItem item : items) {
				System.out.println("itemList："+item);
				// 判断当前是否是上传组件
				if (item.isFormField()) {
					// 不是上传组件
					// 是参数键值对
					String fieldName = item.getFieldName(); // 获取组件名称
					String value = item.getString("utf-8"); // 解决乱码问题

					// 将app信息数据存在map里
					mapList.get(curIndex).put(fieldName.split(":")[0], value);

					System.out.println("参数名："+fieldName);
					System.out.println("参数值："+value);
				} else {
					System.out.println("多文件测试：是张图片");
					mapList.add(new HashMap<>());
					curIndex++;
					// 是上传组件
					// 得到上传文件真实名称
					String fileName = item.getName();

					System.out.println("上传文件名："+fileName);

					fileName = FileUploadUtils.subFileName(fileName);

					// 得到随机名称
					String randomName = FileUploadUtils
							.generateRandonFileName(fileName);

					// 得到随机目录
					String randomDir = FileUploadUtils
							.generateRandomDir(randomName);

					// 图片存储父目录
					String imgurl_parent = imgParentUrl + randomDir;

					File parentDir = new File(request.getServletContext()
							.getRealPath(imgurl_parent));
					// 验证目录是否存在，如果不存在，创建出来
					if (!parentDir.exists()) {
						parentDir.mkdirs();
						System.out.println("文件夹已创建："+parentDir);
					}
					String imgurl = imgurl_parent + "/" + randomName;
					String dbImgUrl = randomDir + "/" + randomName;

					System.out.println("图片路径:" + imgurl);
					System.out.println("数据库储存路径:" + dbImgUrl);

					if(imgParentUrl.equals("/img")){
						mapList.get(curIndex).put("appImg", dbImgUrl);
					}else{
						mapList.get(curIndex).put("functionImg", dbImgUrl);
					}

					//是个图片
					if(randomName.contains(".")){
						// 保存图片
						IOUtils.copy(item.getInputStream(), new FileOutputStream(
								new File(parentDir, randomName)));
					}

					item.delete();
				}
			}
				System.out.println("file upload success");
		} catch (FileUploadException e ) {
			e.printStackTrace();
			System.out.println("file upload err");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("err other");
		}

		return mapList;
	}

	// 将 request 的多文件（参数）上传请求封装成map，其中的文件随机保存在项目img目录中
	// 随机路径 在map的 appImg 键值中
	public static Map<String,String> getUploadMap(HttpServletRequest request,String imgParentUrl) {
		Map map = new HashMap<String,String>();
		DiskFileItemFactory dfif = new DiskFileItemFactory();
		// 设置临时文件存储位置
		dfif.setRepository(new File(request.getServletContext().getRealPath(
				"/temp")));
		// 设置上传文件缓存大小为10m
		dfif.setSizeThreshold(1024 * 1024 * 10);
		// 创建上传组件
		ServletFileUpload upload = new ServletFileUpload(dfif);
		// 处理上传文件中文乱码
		upload.setHeaderEncoding("utf-8");

			try {
				// 解析request得到所有的FileItem（文件和键值对）
				List<FileItem> items = upload.parseRequest(request);
				System.out.println("items"+items);
				// 遍历所有FileItem
				for (FileItem item : items) {
					System.out.println("item："+item);
					// 判断当前是否是上传组件
					if (item.isFormField()) {
						// 是上传组件
						// 参数键值对
						String fieldName = item.getFieldName(); // 获取组件名称
						String value = item.getString("utf-8"); // 解决乱码问题

						// 将app信息数据存在map里
						map.put(fieldName, value);

						System.out.println("参数名："+fieldName);
						System.out.println("参数值："+value);
					} else {
						// 得到上传文件真实名称
						String fileName = item.getName();

						System.out.println("上传文件名："+fileName);

						fileName = FileUploadUtils.subFileName(fileName);

						// 得到随机名称
						String randomName = FileUploadUtils
								.generateRandonFileName(fileName);

						// 得到随机目录
						String randomDir = FileUploadUtils
								.generateRandomDir(randomName);

						// 图片存储父目录
						String imgurl_parent = imgParentUrl + randomDir;

						File parentDir = new File(request.getServletContext()
								.getRealPath(imgurl_parent));
						// 验证目录是否存在，如果不存在，创建出来
						if (!parentDir.exists()) {
							parentDir.mkdirs();
							System.out.println("文件夹已创建："+parentDir);
						}
						String dbImgUrl = imgurl_parent + "/" + randomName;

						System.out.println("数据库储存路径:" + dbImgUrl);

						map.put("imgUrl", dbImgUrl);

						//是个图片
						if(randomName.contains(".")){
						// 保存图片
						IOUtils.copy(item.getInputStream(), new FileOutputStream(
								new File(parentDir, randomName)));
						}

						item.delete();
					}
					System.out.println("file upload success");

				}
			} catch (FileUploadException e ) {
				e.printStackTrace();
				System.out.println("file upload err");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("err other");
			}

			return map;
		}
//	}

	/**
	 * 截取真实文件名
	 * 
	 * @param fileName
	 * @return
	 */
	public static String subFileName(String fileName) {
		// 查找最后一个 \出现位置
		int index = fileName.lastIndexOf("\\");
		if (index == -1) {
			return fileName;
		}
		return fileName.substring(index + 1);
	}

	// 获得随机UUID文件名
	public static String generateRandonFileName(String fileName) {
		// 获得扩展名
		int index = fileName.lastIndexOf(".");
		if (index != -1) {
			String ext = fileName.substring(index);
			return UUID.randomUUID().toString() + ext;
		}
		return UUID.randomUUID().toString();
	}

	// 获得hashcode生成二级目录
	public static String generateRandomDir(String uuidFileName) {
		int hashCode = uuidFileName.hashCode();
		// 一级目录
		int d1 = hashCode & 0xf;
		// 二级目录
		int d2 = (hashCode >> 4) & 0xf;
		return "/" + d1 + "/" + d2;
	}

}
