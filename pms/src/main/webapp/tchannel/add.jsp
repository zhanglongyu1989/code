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
<title>tchannel-add</title>
<script type="text/javascript">
//不为空
var CHKNOTNULL="^[\s\S]*.*[^\s][\s\S]*$";
//顺序
var CHKSORT="^[0-9]$"
function chkcname(){
	//获取栏目名
	var cname=$("#cname").val();
	//定义栏目名匹配的正则表达式
	var reg=new RegExp(CHKNOTNULL);
	if (reg.test(cname)) {//表示输入正确
		$("#resultcname").html("✔");
		$("#resultcname").css("color","green");
		return true;
	} else {//输入失败 
		$("#resultcname").html("栏目名不能为空");
		$("#resultcname").css("color","red");
		$("#cname").val();
		$("#cname").focus();
		return false;
	}
}
function chksort(){
	//获取顺序
	var sort=$("#sort").val();
	//定义顺序匹配的正则表达式
	var reg=new RegExp(CHKSORT);
	if (reg.test(sort)) {//表示输入正确
		$("#resultsort").html("✔");
		$("#resultsort").css("color","green");
		return true;
	} else {//输入失败 
		$("#resultsort").html("请输入数字");
		$("#resultsort").css("color","red");
		$("#sort").val();
		$("#sort").focus();
		return false;
	}
}
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 栏目管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='tchannellist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="tchanneladd.do" method="post">
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
						栏目名:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="cname" id="cname" maxlength="100" 
						onblur="chkcname()"/>
						<span id="resultcname"></span></td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						上级栏目:</td><td width="80%" class="pn-fcontent">
						<select name="pid">
						<c:forEach items="${tchannel}" var="tchannel">
						<option value="${tchannel.id}">${tchannel.cname}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						级别:</td><td width="80%" class="pn-fcontent">
						<input type="radio" class="required" name="lev" value="1" checked="checked"/>1
						<input type="radio" class="required" name="lev" value="2"/>2
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否叶子:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="isleaf" value="1" checked="checked"/>是
						<input type="radio" name="isleaf" value="2"/>否
					</td>
				</tr>
			<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						顺序:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="sort" id="sort" maxlength="80"
						onblur="chksort()"/><span id="resultsort"></span>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交" onclick="return confirm('是否确定提交');"/> &nbsp; 
						<input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>