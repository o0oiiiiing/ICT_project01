package com.ict.forest.kch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClaimDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ClaimVO> claimList() {
		try {
			return sqlSessionTemplate.selectList("claim_table.claimlist");
		} catch (Exception e) {
			System.out.println(e);
		}
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
		try {
			return sqlSessionTemplate.selectOne("claim_table.claimDetail", claim_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
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
		try {
			return sqlSessionTemplate.selectOne("claim_table.claimCount");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public List<ClaimVO> claimList(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			return sqlSessionTemplate.selectList("claim_table.claimList", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int CommentInsert(CCommentVO ccvo) {
		try {
			return sqlSessionTemplate.insert("claim_table.commentinsert", ccvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return -1;
	}
	
	public List<CCommentVO> CommentList(String claim_idx) {
		try {
			return sqlSessionTemplate.selectList("claim_table.commentlist", claim_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
}



















