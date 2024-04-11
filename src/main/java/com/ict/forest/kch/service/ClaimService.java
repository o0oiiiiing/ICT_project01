package com.ict.forest.kch.service;

import java.util.List;

import com.ict.forest.kch.dao.CCommentVO;
import com.ict.forest.kch.dao.ClaimVO;

public interface ClaimService {
	
	// ����Ʈ
		public List<ClaimVO> claimList();
		
		// ����
		public int claimInsert(ClaimVO claimvo);
		
		// �󼼺���
		public ClaimVO claimDetail(String claim_idx);
		
		
		// ���� ����
		public int claimDelete(String claim_idx);
		
		// ���� ���� 
		public int claimUpdate(ClaimVO claimvo);
		
		// ��ȸ�� ������Ʈ
		public int claimUpdate(String claim_idx);
		
		// ����¡ ó�� - ��ü �Խù��� ��
		public int getTotalCount();
		// ����¡ ó���� ���� ����Ʈ
		public List<ClaimVO> claimList(int offset, int limit);
		
		// ��� ��������
		public List<CCommentVO> CommentList(String claim_idx);
		
		// ��� ����
		public int CommentInsert(CCommentVO ccvo);
		
		// ��� ����
		public int CommentDelete(String c_idx);
		
		// �Ű� �亯 ����
		public int claimRes(String claim_res);
		
		
		
		
		
		
}
