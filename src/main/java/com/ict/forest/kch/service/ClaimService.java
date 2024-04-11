package com.ict.forest.kch.service;

import java.util.List;

import com.ict.forest.kch.dao.CCommentVO;
import com.ict.forest.kch.dao.ClaimVO;

public interface ClaimService {
	
	// 리스트
		public List<ClaimVO> claimList();
		
		// 삽입
		public int claimInsert(ClaimVO claimvo);
		
		// 상세보기
		public ClaimVO claimDetail(String claim_idx);
		
		
		// 원글 삭제
		public int claimDelete(String claim_idx);
		
		// 원글 수정 
		public int claimUpdate(ClaimVO claimvo);
		
		// 조회수 업데이트
		public int claimUpdate(String claim_idx);
		
		// 페이징 처리 - 전체 게시물의 수
		public int getTotalCount();
		// 페이징 처리를 위한 리스트
		public List<ClaimVO> claimList(int offset, int limit);
		
		// 댓글 가져오기
		public List<CCommentVO> CommentList(String claim_idx);
		
		// 댓글 삽입
		public int CommentInsert(CCommentVO ccvo);
		
		// 댓글 삭제
		public int CommentDelete(String c_idx);
		
		// 신고 답변 유무
		public int claimRes(String claim_res);
		
		
		
		
		
		
}
