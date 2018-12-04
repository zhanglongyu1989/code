package com.zs.pms.controller;

import java.security.interfaces.DSAKey;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.Tuser;
import com.zs.pms.service.DepService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@Controller
public class UserController {
@Autowired
UserService us;
@Autowired
DepService ds;
@RequestMapping("/user/list.do")
public String list(QueryUser query,String page,ModelMap map){
	if(page==null||"".equals(page)){
		page="1";
	}
	map.addAttribute("LIST", us.queryByPage(query, Integer.parseInt(page)));
	map.addAttribute("PAGECONT",us.queryPageCount(query));
	map.addAttribute("PAGE",page);
	map.addAttribute("QUERY", query);
	return "user/list";
}
@RequestMapping("/user/toadd.do")
public String toadd(ModelMap map){
	List<TDep> list1=ds.queryByPid(0);
	map.addAttribute("DLIST1",list1);
	List<TDep> list2=ds.queryByPid(list1.get(0).getId());
	map.addAttribute("DLIST2", list2);
	return "user/add";
}
@RequestMapping("/user/getdep.do")
@ResponseBody
public List<TDep> getDept(int pid){
	List<TDep> list=ds.queryByPid(pid);
	return list;
}
@RequestMapping("/user/add.do")
public String add(Tuser user,ModelMap map,HttpSession session){
	
	try {
		Tuser cuser=(Tuser)session.getAttribute("CUSER");
		user.setCreator(cuser.getId());
		us.insert(user);
		return "redirect:list.do";
	} catch (AppException e) {
		// TODO Auto-generated catch block
		map.addAttribute("MSG",e.getErrMsg());
		return this.toadd(map);
	}
}
/**
 * 删一条
 * 
 * @param id
 * @return
 */
@RequestMapping("/user/delete.do")
public String deleteOne(int id) {
	try {
		us.delete(id);
	} catch (AppException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} // where id=? 使用索引 效率高
	// 刷新
	return "redirect:list.do";
}

/**
 * 删多条
 * 
 * @param ids
 * @return
 */
@RequestMapping("/user/deletes.do")
public String deleteMany(int[] ids) {
	us.deleteByIds(ids); 
	// 刷新
	return "redirect:list.do";

}

@RequestMapping("/user/get.do")
public String get(int id, ModelMap map) {

	// 获得用户信息
	Tuser user = us.queryById(id);

	/*
	 * 部门初始化
	 */
	// 获得一级部门列表
	List<TDep> list1 = ds.queryByPid(0);

	// 获得该用户所有一级部门下的二级部门
	List<TDep> list2 = ds.queryByPid(user.getDept().getPid());

	// 一级部门
	map.addAttribute("DLIST1", list1);
	// 二级部门
	map.addAttribute("DLIST2", list2);

	// 用户信息
	map.addAttribute("USER", user);
	return "user/update";
}

@RequestMapping("/user/update.do")
public String update(Tuser user,HttpSession session,ModelMap map) {
	
	Tuser cu = (Tuser) session.getAttribute("CUSER");

	user.setUpdator(cu.getId());
	try {
		us.update(user);
	
		return "redirect:list.do";
	} catch (AppException e) {
		// TODO Auto-generated catch block
		map.addAttribute("MSG", e.getErrMsg());
		return get(user.getId(), map);
	}
		
}
}
