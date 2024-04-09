package com.ict.forest.kch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClaimDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ClaimVO> claimList() {
		return null;
	}

	public int claimInsert(ClaimVO claimvo) {
		try {
			return sqlSessionTemplate.insert("claim_table.claimInsert", claimvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return -1;
	}

	public ClaimVO claimDetail(String claim_idx) {
		return null;
	}

	public int claimDelete(String claim_idx) {
		return 0;
	}

	public int claimUpdate(ClaimVO claimvo) {
		return 0;
	}

	public int claimUpdate(String claim_idx) {
		return 0;
	}

	public int getTotalCount() {
		return 0;
	}

	public List<ClaimVO> claimList(int offset, int limit) {
		return null;
	}
	
	
}
