package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.Tuser;
import com.zs.pms.vo.QueryUser;

public interface UserService {
//	��¼
	public Tuser chkLogin(QueryUser query) throws AppException;
//	������ѯ
	public List<Tuser> queryByCon(QueryUser query);
//	����ɾ��
	public void deleteByIds(int[] ids);
//	ɾ��һ��
	public void delete(int id)throws AppException;
//	�޸�
	public void update(Tuser user) throws AppException;
//	����
	public int insert(Tuser user)throws AppException;
//	���һ��
	public Tuser queryById(int id);
//	���ҳ
	public List<Tuser> queryByPage(QueryUser query,int page);
//	�����ҳ��
	public int queryPageCount(QueryUser query);
}
