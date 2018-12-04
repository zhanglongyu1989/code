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

<link rel="stylesheet" href="res/css/style.css" />
<title>tchannel-update</title>
<script type="text/javascript">
//不为空
var CHKNOTNULL="^[\s\S]*.*[^\s][\s\S]*$";
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
function upa(){
 var con=confirm("确定修改该栏目");
 if (con) {
	return true;
} else {
	history.back();
return false;
}
}
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 栏目管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='tchannellist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="tchannelupdate.do?id=${tchannel.id }" method="post">
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
						<input type="text" class="required" name="cname" id="cname" maxlength="100" value="${tchannel.cname}" onblur="chkcname()"/>
						<span id="resultcname"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						上级栏目:</td><td width="80%" class="pn-fcontent">
						<select name="pid">
						<c:forEach items="${channels}" var="chl">
						<c:if test="${tchannel.pid==chl.id }">
						<!-- 显示所属频道 -->
						<option value="${chl.id}" selected="selected">${chl.cname}</option>
						</c:if>
						<c:if test="${tchannel.pid!=chl.id }">
						<!-- 显示其他频道 -->
						<option value="${chl.id}" >${chl.cname}</option>
						</c:if>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						级别:</td><td width="80%" class="pn-fcontent">
						<c:if test="${tchannel.lev==1 }">
						<input type="radio" class="required" name="lev" value="1" checked="checked"/>一级
						<input type="radio" class="required" name="lev" value="2"/>二级
						</c:if>
						<c:if test="${tchannel.lev==2 }">
						<input type="radio" class="required" name="lev" value="1" />一级
						<input type="radio" class="required" name="lev" value="2" checked="checked"/>二级
						</c:if>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否叶子:</td><td width="80%" class="pn-fcontent">
						<c:if test="${tchannel.isleaf=='1' }">
						<input type="radio" name="isleaf" value="1" checked="checked"/>是
						<input type="radio" name="isleaf" value="2"/>否
						</c:if>
						<c:if test="${tchannel.isleaf=='2' }">
							<input type="radio" name="isleaf" value="1" />是
						<input type="radio" name="isleaf" value="2" checked="checked"/>否
						</c:if>
					</td>
				</tr>
				</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" onclick="return upa()" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>