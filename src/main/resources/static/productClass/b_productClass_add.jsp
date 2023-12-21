<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productclass.model.*"%>

<%
ProductClass productClass = (ProductClass) request.getAttribute("productClass");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>新增商品分類</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/sl.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backend_sidebar.css">
<!-- <link rel="stylesheet" href="css/jquery.dataTables.min.css"> -->
<style>
/* 查看詳情button */
.sl_btn_chakan {
	cursor: pointer;
	--bs-btn-color: #fff;
	--bs-btn-bg: #9ac972;
	--bs-btn-border-color: #9ac972;
	--bs-btn-hover-color: #fff;
	--bs-btn-hover-bg: #9ac972;
	--bs-btn-hover-border-color: #9ac972;
	--bs-btn-focus-shadow-rgb: 49, 132, 253;
	--bs-btn-active-color: #fff;
	--bs-btn-active-bg: #9ac972;
	--bs-btn-active-border-color: #9ac972;
	--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	--bs-btn-disabled-color: #fff;
	--bs-btn-disabled-bg: #9ac972;
	--bs-btn-disabled-border-color: #9ac972;
	--bs-btn-padding-x: 0.75rem;
	--bs-btn-padding-y: 0.375rem;
	--bs-btn-font-family:;
	--bs-btn-font-size: 1rem;
	--bs-btn-font-weight: 400;
	--bs-btn-line-height: 1.5;
	--bs-btn-border-width: 1px;
	--bs-btn-border-radius: 0.375rem;
	--bs-btn-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 1px
		rgba(0, 0, 0, 0.075);
	--bs-btn-disabled-opacity: 0.65;
	--bs-btn-focus-box-shadow: 0 0 0 0.25rem
		rgba(var(--bs-btn-focus-shadow-rgb), .5);
	display: inline-block;
	padding: var(--bs-btn-padding-y) var(--bs-btn-padding-x);
	font-family: var(--bs-btn-font-family);
	font-size: var(--bs-btn-font-size);
	font-weight: var(--bs-btn-font-weight);
	line-height: var(--bs-btn-line-height);
	color: var(--bs-btn-color);
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	-moz-user-select: none;
	user-select: none;
	border: var(--bs-btn-border-width) solid var(--bs-btn-border-color);
	border-radius: var(--bs-btn-border-radius);
	background-color: var(--bs-btn-bg);
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

/* disable button */
.sl_btn_disable {
	cursor: pointer;
	--bs-btn-color: #9ac972;
	--bs-btn-bg: #fff;
	--bs-btn-border-color: #9ac972;
	--bs-btn-hover-color: #fff;
	--bs-btn-hover-bg: ##fff;
	--bs-btn-hover-border-color: #9ac972;
	--bs-btn-focus-shadow-rgb: 49, 132, 253;
	--bs-btn-active-color: #fff;
	--bs-btn-active-bg: ##fff;
	--bs-btn-active-border-color: #9ac972;
	--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	--bs-btn-disabled-color: #fff;
	--bs-btn-disabled-bg: #fff;
	--bs-btn-disabled-border-color: #9ac972;
	--bs-btn-padding-x: 0.75rem;
	--bs-btn-padding-y: 0.375rem;
	--bs-btn-font-family:;
	--bs-btn-font-size: 1rem;
	--bs-btn-font-weight: 400;
	--bs-btn-line-height: 1.5;
	--bs-btn-border-width: 1px;
	--bs-btn-border-radius: 0.375rem;
	--bs-btn-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 1px
		rgba(0, 0, 0, 0.075);
	--bs-btn-disabled-opacity: 0.65;
	--bs-btn-focus-box-shadow: 0 0 0 0.25rem
		rgba(var(--bs-btn-focus-shadow-rgb), .5);
	display: inline-block;
	padding: var(--bs-btn-padding-y) var(--bs-btn-padding-x);
	font-family: var(--bs-btn-font-family);
	font-size: var(--bs-btn-font-size);
	font-weight: var(--bs-btn-font-weight);
	line-height: var(--bs-btn-line-height);
	color: var(--bs-btn-color);
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	-moz-user-select: none;
	user-select: none;
	border: var(--bs-btn-border-width) solid var(--bs-btn-border-color);
	border-radius: var(--bs-btn-border-radius);
	background-color: var(--bs-btn-bg);
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

/* 狀態badge */
.sl_sp_badge {
	--bs-badge-padding-x: 0.65em;
	--bs-badge-padding-y: 0.35em;
	--bs-badge-font-size: 0.75em;
	--bs-badge-font-weight: 700;
	--bs-badge-color: #fff;
	--bs-badge-border-radius: 0.375rem;
	display: inline-block;
	padding: var(--bs-badge-padding-y) var(--bs-badge-padding-x);
	font-size: var(--bs-badge-font-size);
	font-weight: var(--bs-badge-font-weight);
	line-height: 1;
	color: var(--bs-badge-color);
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: var(--bs-badge-border-radius);
	color: #fff !important;
	/* background-color: #FFC2A0 !important; */
}
</style>
</head>

<body>

	<div class="headerPage"></div>

	<div class="container">
		<div class="sidebarPage"></div>
		<main class="content">
			<p class="p_title">新增商品類別</p>
			<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
			<FORM METHOD="post" ACTION="pc.do" name="form1">
				<table>

					<tr>
						<td>商品類別名稱:</td>
						<td><input type="TEXT" name="pClassName"
							value="<%=(productClass == null) ? "請輸入商品類別名稱" : productClass.getpClassName()%>"
							size="45" /></td>
					</tr>


				</table>
				<br> 
				 <div class="row justify-content-start">
                <div class="col-4">
                    <button type="submit" onclick="history.go(-1)" class="sl_btn_disable">回上一頁</button>
                     <input type="hidden" name="action" value="insert">
                    <button type="submit" class="sl_btn_chakan" style="float: right;">確認送出</button>
                </div>
            </div>

			</FORM>
		</main>
	</div>

	<div class="footerPage"></div>

	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>

	<script>
		$(".sidebarPage").load("backendSidebar.html");
	</script>
 	<script> 
 		// 日期
 // 		var today = new Date();
 // 		sl_start.min = new Date((today.setDate(today.getDate())))
 // 				.toLocaleDateString('fr-ca');
 // 		sl_end.min = sl_start.min;
 	</script>
	
</body>








</html>