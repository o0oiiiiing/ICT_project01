package com.ict.forest.kch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.kch.dao.CCommentVO;
import com.ict.forest.kch.dao.ClaimDAO;
import com.ict.forest.kch.dao.ClaimVO;

@Service
public class ClaimServiceImpl implements ClaimService{
	
	@Autowired
	private ClaimDAO claimDAO;
	
	@Override
	public List<ClaimVO> claimList() {
		return claimDAO.claimList();
	}

	@Override
	public int claimInsert(ClaimVO claimvo) {
		return claimDAO.claimInsert(claimvo);
	}

	@Override
	public ClaimVO claimDetail(String claim_idx) {
		return claimDAO.claimDetail(claim_idx);
	}

	@Override
	public int claimDelete(String claim_idx) {
		return 0;
	}

	@Override
	public int claimUpdate(ClaimVO claimvo) {
		return 0;
	}

	@Override
	public int claimUpdate(String claim_idx) {
		return 0;
	}

	@Override
	public int getTotalCount() {
		return claimDAO.getTotalCount();
	}

	@Override
	public List<ClaimVO> claimList(int offset, int limit) {
		return claimDAO.claimList(offset, limit);
	}

	@Override
	public List<CCommentVO> CommentList(String claim_idx) {
		return claimDAO.CommentList(claim_idx);
	}

	@Override
	public int CommentInsert(CCommentVO ccvo) {
		return claimDAO.CommentInsert(ccvo);
	}

	@Override
	public int CommentDelete(String cc_idx) {
		return 0;
	}

	

	

	

}
