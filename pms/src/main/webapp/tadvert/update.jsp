<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>
<!-- 引入jQuery -->
<script type="text/javascript" language="javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 引入日期控件 -->
<script type="text/javascript" language="javascript" src="js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="res/css/style.css" />
<link rel="stylesheet" href="res/css/style.css" />
<title>tadvert-update</title>
<script type="text/javascript"">
	//不为空
	var CHKNOTNULL="^[\s\S]*.*[^\s][\s\S]*$";
	function chktitle(){
		//获取标题
		var title=$("#title").val();
		//定义标题匹配的正则表达式
		var reg=new RegExp(CHKNOTNULL);
		if (reg.test(title)) {//表示输入正确
			$("#resulttitle").html("✔");
			$("#resulttitle").css("color","green");
			return true;
		} else {//输入失败 
			$("#resulttitle").html("不能为空");
			$("#resulttitle").css("color","red");
			$("#title").val();
			$("#title").focus();
			return false;
		}
	}
	function chkcontent(){
		//获取内容
		var content=$("#content").val();
		//定义内容匹配的正则表达式
		var reg=new RegExp(CHKNOTNULL);
		if (reg.test(content)) {//表示输入正确
			$("#resultcontent").html("✔");
			$("#resultcontent").css("color","green");
			return true;
		} else {//输入失败 
			$("#resultcontent").html("不能为空");
			$("#resultcontent").css("color","red");
			$("#content").val();
			$("#content").focus();
			return false;
		}
	}
	function chkcrman(){
		//获取内容
		var crman=$("#crman").val();
		//定义内容匹配的正则表达式
		var reg=new RegExp(CHKNOTNULL);
		if (reg.test(crman)) {//表示输入正确
			$("#resultcrman").html("✔");
			$("#resultcrman").css("color","green");
			return true;
		} else {//输入失败 
			$("#resultcrman").html("不能为空");
			$("#resultcrman").css("color","red");
			$("#crman").val();
			$("#crman").focus();
			return false;
		}
	}
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 快报管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='tadvertlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="tadvertupdate.do?id=${tadvert.id }" method="post">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired"></span>
						<span class="pn-frequired">${msg}</span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						标题:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="title" id="title" maxlength="100" value="${tadvert.title }" onblur="chktitle()"/>
						<span id="resulttitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						内容:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="content" id="content" maxlength="100"  value="${tadvert.content }" onblur="chkcontent()"/>
					<span id="resultcontent"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						公告时间:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="Wdate" name="crtime" maxlength="100"  value="${tadvert.crtime }"
						onclick="WdatePicker()"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						公告人:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="crman" id="crman" maxlength="100"  value="${tadvert.crman }" onblur="chkcrman()"/>
						<span id="resultcrman"></span>
					</td>
				</tr>
				
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>