package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.Tuser;
import com.zs.pms.vo.QueryUser;

public interface UserDao {
	//通过条件查询
	public List<Tuser> queryByCon(QueryUser query);
//	查分页
	public List<Tuser> queryByPage(QueryUser query);
//	通过主键查询
	public Tuser queryById(int id);
//	批量删除
	public void deleteByIds(int[] ids);
//	修改
	public void update(Tuser user);
//	查询总条数
	public int queryCount(QueryUser query);
//	增加
	public int insert(Tuser user);
//	删除
	public void delete(int id);
}
