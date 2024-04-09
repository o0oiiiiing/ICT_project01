package com.ict.forest.kch.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ict.forest.kch.dao.ClaimVO;

@Service
public class ClaimServiceImpl implements ClaimService{

	@Override
	public List<ClaimVO> claimList() {
		return null;
	}

	@Override
	public int claimInsert(ClaimVO claimvo) {
		return 0;
	}

	@Override
	public ClaimVO claimDetail(String claim_idx) {
		return null;
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
		return 0;
	}

	@Override
	public List<ClaimVO> claimList(int offset, int limit) {
		return null;
	}

	

}
