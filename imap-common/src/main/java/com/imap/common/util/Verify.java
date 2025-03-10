package com.imap.common.util;

import com.imap.common.pojo.DataReport;
import com.imap.common.pojo.MenuTypeEnum;
import com.imap.common.pojo.Role;

import java.text.DecimalFormat;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**  
 * @Title: Verify
 * @ProjectName qingfeng
 * @Description: Verify验证
 * @author qingfeng
 * @date 2018-8-24 11:45
 */
public class Verify {

	/**
	 * 数字
	 */
	private static Pattern pattern = Pattern.compile("^\\d+(\\.\\d{1,12})?$");

	/**
	 * 
	* @Title: verifyIsNull
	* @Description: true不为空，false为空
	* @param @param str
	* @param @return    设定文件
	* @return boolean    返回类型
	* @throws
	 */
	public static boolean verifyIsNotNull(String str){
		if(str==null||str.equals("")){
			return false;
		}else{
			return true;
		}
	}
	
	/**
	 * 
	* @Title: verifyIsNull
	* @Description: 验证对象
	* @param @param obj
	* @param @return    设定文件
	* @return boolean    返回类型
	* @throws
	 */
	public static boolean verifyIsNotNull(Object obj){
		if(obj==null||obj.equals("")||obj=="undefined"){
			return false;
		}else{
			return true;
		}
	}

	public static boolean verifyIsNull(Object obj){
		if(obj!=null&&!obj.equals("")&&obj!="undefined"){
			return false;
		}else{
			return true;
		}
	}
	
	/**
	 * 判断是否是数字
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str){ 
	   Matcher isNum = pattern.matcher(str);
	   if( !isNum.matches() ){
	       return false; 
	   }
	   return true; 
	}
	
	/**
	 * 保留两位小数
	 * @param str
	 * @return
	 */
	public static String NumberFormatDouble(String str){ 
	   DecimalFormat df = new DecimalFormat("0.00");
//	   System.out.println(df.format(Double.parseDouble(str)));
	   return df.format(Double.parseDouble(str)); 
	}
		
	/**
	 * 保留整数
	 * @param str
	 * @return
	 */
	public static String NumberFormatInteger(String str){ 
	   DecimalFormat df = new DecimalFormat("#");
//		   System.out.println(df.format(Double.parseDouble(str)));
	   return df.format(Double.parseDouble(str)); 
	}
	
	public static void main(String[] args) {
		System.out.println(NumberFormatDouble("110210.12323"));
	}


	public static String verifyNumToZero(Object obj){
		if(obj==null||obj.equals("")||obj=="undefined"||obj.equals("/")){
			return "0";
		}else{
			return obj.toString();
		}
	}

	public static boolean verifyIsNotNullAndZero(Object obj){
		if (obj == null || obj.equals("") || obj.equals("0") || obj.equals(0) || obj.equals("0.0") || obj.equals(0.0) || obj.equals(0.000000) || obj.equals("0.000000")) {
			return false;
		}else{
			return true;
		}
	}


	/**
	 * 是否包含字符串
	 *
	 * @param str 验证字符串
	 * @param strs 字符串组
	 * @return 包含返回true
	 */
	public static boolean inStringIgnoreCase(String str, String... strs)
	{
		if (str != null && strs != null)
		{
			for (String s : strs)
			{
				if (str.equalsIgnoreCase(trim(s)))
				{
					return true;
				}
			}
		}
		return false;
	}

	public static String trim(String str)
	{
		return (str == null ? "" : str.trim());
	}

	public static boolean verifyIsNull(PageData pd, String... keys) {
		if(pd==null) return true;
		for (String key : keys) {
			Object obj = pd.get(key);
			if(obj==null||obj.equals("")||obj.equals("undefined"))return true;
		}
		return false;
	}

	public static void removeNull(PageData pd, String... keys) {
		for (String key : keys) {
			if(verifyIsNull(pd.get(key)))pd.remove(key);
		}
	}

	public static boolean authority(String url, Role role) {
		String config = role.getRoleConfig();
		if(url==null){
			return true;
		}
		if(config == null) {
			return false;
		}
		if(url.contains(MenuTypeEnum.ONLINE.getCode()) && !config.contains(MenuTypeEnum.ONLINE.getCode())){
			return false;
		}
		if(url.contains(MenuTypeEnum.HISTORY.getCode()) && !config.contains(MenuTypeEnum.HISTORY.getCode())){
			return false;
		}
		if(url.contains(MenuTypeEnum.USER.getCode()) && !config.contains(MenuTypeEnum.USER.getCode())){
			return false;
		}
		if(url.contains(MenuTypeEnum.ROLE.getCode()) && !config.contains(MenuTypeEnum.ROLE.getCode())){
			return false;
		}
		if(url.contains(MenuTypeEnum.SITE.getCode()) && !config.contains(MenuTypeEnum.SITE.getCode())){
			return false;
		}
		if(url.contains(MenuTypeEnum.ALARM.getCode()) && !config.contains(MenuTypeEnum.ALARM.getCode())){
			return false;
		}
		return true;
	}

	public static void checkStatus(AtomicInteger count, DataReport siteDataVO) {
		if(siteDataVO.getStatus() == 2){
			long start = System.currentTimeMillis();
			System.out.println("=================");
			System.out.println("测试开始，当前数据偏移量：" +  count.get());
			System.out.println("系统时间：" +  start);
			System.out.println("首条消息时间：" +  siteDataVO.getTimestamp());
			System.out.println("时延：" +  (start - siteDataVO.getTimestamp()) + "ms");
		}
		if(siteDataVO.getStatus() == 3){
			long end = System.currentTimeMillis();
			System.out.println("测试开始，当前数据偏移量：" +  count.get());
			System.out.println("最终数据产生时间：" +  siteDataVO.getTimestamp());
			System.out.println("测试结束系统时间：" +  end);
			// 1400是单次测试的误差，抹去后测试数据积累后的时延
			System.out.println("时延：" +  (end - siteDataVO.getTimestamp()) + "ms");
		}
	}
}
