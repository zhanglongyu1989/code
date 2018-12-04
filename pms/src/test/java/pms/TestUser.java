package pms;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.Tuser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryPage;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationcontext.xml")
public class TestUser {
	@Autowired
	UserService us;

	public void testlogin() {
		QueryUser query = new QueryUser();
		query.setLoginname("test1");
		query.setPassword("12345");
		try {
			Tuser user = us.chkLogin(query);
			System.out.println(user.getRealname() + "," + user.getDept().getName());
			for (TPermission per : user.getPermissions()) {
				System.out.println(per.getPname());
			}
			System.out.println("--------------");
			for (TPermission tpe1 : user.getMenu()) {
				System.out.println(tpe1.getPname());
				for (TPermission tpe2 : tpe1.getChildren()) {
					System.out.println("\t\t" + tpe2.getPname());
				}
			}
		} catch (AppException e) {
			System.out.println(e.getErrMsg());
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
		}

	}

	
	public void test() {
		QueryUser query = new QueryUser();
		//query.setLoginname("test1");
		//query.setPassword("12345");
		query.setIsenabled(1);
		query.setPage(1);
		us.queryByCon(query);
	}
	
	public void testDelete(){

		try {
			us.delete(102);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void testUpdate(){
		Tuser user=new Tuser();
		user.setId(3085);
		user.setSex("女");
		try {
			us.update(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	public void testAdd(){
		Tuser user=new Tuser();
		user.setBirthday(new Date());
		TDep dep=new TDep();
		dep.setId(6);
		user.setDept(dep);
		user.setLoginname("abc1");
		user.setEmail("qwe@123.com");
		user.setPassword("abc");
		user.setPic("aaa.jsp");
		user.setRealname("测试员");
		user.setSex("男");
		user.setCreator(1000);
		try {
			us.insert(user);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void testPage(){
		QueryUser query=new QueryUser();
		System.out.println("当前页数"+us.queryPageCount(query));
		for(Tuser user:us.queryByPage(query, 1)){
			System.out.println(user.getRealname());
		}
		
		
	}
}
