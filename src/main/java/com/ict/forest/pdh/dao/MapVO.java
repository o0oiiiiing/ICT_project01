package com.ict.forest.pdh.dao;

import java.util.Map;

public class MapVO {
	private Map<String, String[]> search_map;
	private int limit, offset;
	public Map<String, String[]> getSearch_map() {
		return search_map;
	}
	public void setSearch_map(Map<String, String[]> search_map) {
		this.search_map = search_map;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
}
