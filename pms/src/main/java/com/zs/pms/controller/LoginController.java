package com.zs.pms.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.Tuser;
import com.zs.pms.service.UserService;
import com.zs.pms.util.DateUtil;
import com.zs.pms.vo.QueryUser;

@Controller
public class LoginController {
	@Autowired
	UserService us;
	@RequestMapping("/tologin.do")
	public String toLogin(){
		return "login";
		
	}
	@RequestMapping("/totop.do")
	public String toTop(){
		return "top";
		
	}
	@RequestMapping("/toright.do")
	public String toRight(){
		return "right";
		
	}
	@RequestMapping("/toleft.do")
	public String toLeft(){
		return "left";
		
	}
@RequestMapping("/login.do")
	public String login(QueryUser query,String code,ModelMap model,HttpSession session){
	String ocode=(String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
	if(!ocode.equals(code)){
		model.addAttribute("MSG", "验证码错误，请重新输入");
		return "login";
	}
		Tuser user;
		try {
			user=us.chkLogin(query);
			session.setAttribute("CUSER", user);
			session.setAttribute("TODAY", DateUtil.getStrDate(new Date()));
			return "main";
		} catch (AppException e) {
			// TODO Auto-generated catch block
		model.addAttribute("MSG", e.getErrMsg());
		return "login";
		}catch(Exception e1){
			e1.printStackTrace();
			return "error";
		}
	
}
}
