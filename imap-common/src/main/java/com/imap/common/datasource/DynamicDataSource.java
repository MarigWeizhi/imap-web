package com.imap.common.datasource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected Object determineCurrentLookupKey() {
//		logger.info("数据源为{}",JdbcContextHolder.getDataSource());
//		System.out.println("当前数据源为{}"+JdbcContextHolder.getDataSource());
		return JdbcContextHolder.getDataSource();
	}
	
}