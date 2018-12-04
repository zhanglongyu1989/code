package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.Tuser;
import com.zs.pms.vo.QueryUser;

public interface UserDao {
	//ͨ��������ѯ
	public List<Tuser> queryByCon(QueryUser query);
//	���ҳ
	public List<Tuser> queryByPage(QueryUser query);
//	ͨ��������ѯ
	public Tuser queryById(int id);
//	����ɾ��
	public void deleteByIds(int[] ids);
//	�޸�
	public void update(Tuser user);
//	��ѯ������
	public int queryCount(QueryUser query);
//	����
	public int insert(Tuser user);
//	ɾ��
	public void delete(int id);
}
