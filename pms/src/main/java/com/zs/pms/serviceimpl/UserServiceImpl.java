package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.UserDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.Tuser;
import com.zs.pms.service.UserService;
import com.zs.pms.util.Constants;
import com.zs.pms.util.MD5;
import com.zs.pms.vo.QueryUser;

@Service
@Transactional
public class UserServiceImpl implements UserService{
@Autowired
private UserDao udao;
	@Override
	public Tuser chkLogin(QueryUser query) throws AppException {
		MD5 md5=new MD5();
		String p1=md5.getMD5ofStr(query.getPassword());
		query.setPassword(p1);
		List<Tuser> list=udao.queryByCon(query);
		if (list==null||list.size()!=1) {
			throw new AppException(1000, "�û������������");
		}
		Tuser user=list.get(0);
		return udao.queryById(user.getId());
	}
	@Override
	public List<Tuser> queryByCon(QueryUser query) {
		// TODO Auto-generated method stub
		return udao.queryByCon(query);
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void deleteByIds(int[] ids) {
		// TODO Auto-generated method stub
		udao.deleteByIds(ids);
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void update(Tuser user) throws AppException {
		// TODO Auto-generated method stub
		// ģ��ҵ���쳣
		if (user.getPassword().length() <= 0) {
			throw new AppException(1004, "���벻��Ϊ��");
		}

		// TODO Auto-generated method stub
		// ������뱻���˲����¼��� ������32
		if (user.getPassword().length() != 32) {
			// ���뵽�����ת��

			MD5 m = new MD5();
			user.setPassword(m.getMD5ofStr(user.getPassword()));

		}

		udao.update(user);
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insert(Tuser user) throws AppException {
		// TODO Auto-generated method stub
		// ��¼����admin����ҵ���쳣
				if ("admin".equals(user.getLoginname())) {
					throw new AppException(1002, "��¼��������admin");
				}

				
				MD5 m = new MD5();
				user.setPassword(m.getMD5ofStr(user.getPassword()));
				
				
				return udao.insert(user);
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void delete(int id) throws AppException {
		// TODO Auto-generated method stub
		udao.delete(id);
	}
	@Override
	public Tuser queryById(int id) {
		// TODO Auto-generated method stub
		return udao.queryById(id);
	}
	@Override
	public List<Tuser> queryByPage(QueryUser query, int page) {
		// TODO Auto-generated method stub
		query.setPage(page);
		return udao.queryByPage(query);
	}
	@Override
	public int queryPageCount(QueryUser query) {
		// TODO Auto-generated method stub
		int count=udao.queryCount(query);
		if (count%Constants.PAGECOUNT==0) {
			return count/Constants.PAGECOUNT;
		}else {
			return count/Constants.PAGECOUNT+1;
		}
		
	}

}
