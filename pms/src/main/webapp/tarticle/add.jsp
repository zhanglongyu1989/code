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
<!-- 引入jQuery -->
<script type="text/javascript" language="javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 引入日期控件 -->
<script type="text/javascript" language="javascript" src="js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="res/css/style.css" />
<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="res/css/style.css" />
<title>tarticle-add</title>
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
	function chkauthor(){
		//获取内容
		var author=$("#author").val();
		//定义内容匹配的正则表达式
		var reg=new RegExp(CHKNOTNULL);
		if (reg.test(author)) {//表示输入正确
			$("#resultauthor").html("✔");
			$("#resultauthor").css("color","green");
			return true;
		} else {//输入失败 
			$("#resultauthor").html("不能为空");
			$("#resultauthor").css("color","red");
			$("#author").val();
			$("#author").focus();
			return false;
		}
	}
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='tarticlelist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="tarticleadd.do" method="post">
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
						<input type="text" class="required" name="title" id="title" maxlength="100" onblur="chktitle()"/>
						<span id="resulttitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						内容:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="content" id="content" maxlength="100" onblur="chkcontent()"/>
						<span id="resultcontent"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						作者:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="author" id="author" maxlength="100" onblur="chkauthor()"/>
						<span id="resultauthor"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						创建时间:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="Wdate" name="crtime" maxlength="100"
						onclick="WdatePicker()"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
					<span class="pn-frequired">*</span>
						所属栏目:</td><td width="80%" class="pn-fcontent">
						<select name="channel">
						<c:forEach items="${atchans}" var="atchans">
						<option value="${atchans.id}" name="id">${atchans.cname}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否推荐:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="isremod" value="1" checked="checked"/>是
						<input type="radio" name="isremod" value="2"/>否
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否热点:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="ishot" value="1" checked="checked"/>是
						<input type="radio" name="ishot" value="2"/>否
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