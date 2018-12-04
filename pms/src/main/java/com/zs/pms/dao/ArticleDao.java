package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TArticle;
import com.zs.pms.po.Tuser;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryUser;

public interface ArticleDao {
	//ͨ��������ѯ
		public List<TArticle> queryByCon(QueryArticle query);
//		���ҳ
		public List<TArticle> queryByPage(QueryArticle query);
//		ͨ��������ѯ
		public TArticle queryById(int id);
//		����ɾ��
		public void deleteByIds(int[] ids);
//		�޸�
		public void update(TArticle article);
//		��ѯ������
		public int queryCount(QueryArticle query);
//		����
		public int insert(TArticle article);
//		ɾ��
		public void delete(int id);
	}

