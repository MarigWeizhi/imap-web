package com.imap.common.datasource;

public class JdbcContextHolder {
	
	private final static ThreadLocal<String> local = new ThreadLocal<>();
	
	public static void putDataSource(String name) {
		local.set(name);
	}
	
	public static String getDataSource() {
		return local.get();
	}
	
}