package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TDep;

public interface DepDao {
	//�����ϼ�id��ò����б�
	public List<TDep> queryByPid(int pid);
	
}