package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.po.Tuser;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryUser;

public interface ArticleService {
//	������ѯ
	public List<TArticle> queryByCon(QueryArticle query);
//	����ɾ��
	public void deleteByIds(int[] ids);
//	ɾ��һ��
	public void delete(int id)throws AppException;
//	�޸�
	public void update(TArticle article) throws AppException;
//	����
	public int insert(TArticle article)throws AppException;
//	���һ��
	public TArticle queryById(int id);
//	���ҳ
	public List<TArticle> queryByPage(QueryArticle query,int page);
//	�����ҳ��
	public int queryPageCount(QueryArticle query);
}
