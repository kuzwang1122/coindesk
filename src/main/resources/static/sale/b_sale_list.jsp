<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sale.model.*"%>

<%
    SaleService saleSvc = new SaleService();
    List<Sale> list = saleSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/sl.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/backend_sidebar.css">
    
    <title>優惠管理</title>
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
            --bs-btn-font-family: ;
            --bs-btn-font-size: 1rem;
            --bs-btn-font-weight: 400;
            --bs-btn-line-height: 1.5;
            --bs-btn-border-width: 1px;
            --bs-btn-border-radius: 0.375rem;
            --bs-btn-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 1px rgba(0, 0, 0, 0.075);
            --bs-btn-disabled-opacity: 0.65;
            --bs-btn-focus-box-shadow: 0 0 0 0.25rem rgba(var(--bs-btn-focus-shadow-rgb), .5);
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
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
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
            <div>
                <p class="p_subtitle" style="float:left; margin-top:0;">優惠碼</p>
                <a href="b_sale_add.jsp"><button type="button" class="sl_btn_chakan"
                        style="float:right; margin-bottom: 20px;">新增</button></a>
            </div>
            <table id="example1" class="display" style="width:100%">
                <thead>
                    <tr >
                        <th>優惠碼ID</th>
                        <th>優惠碼</th>
                        <th>優惠開始日</th>
                        <th>優惠結束日</th>
                        <th>優惠條件</th>
						<th>折抵金額</th>
						<th>修改</th>
						<th>刪除</th>
                    </tr>
                </thead>
                <tbody>
                    
	<c:forEach var="sale" items="${list}" >
		
		<tr>
			<td>${sale.saleID}</td>
			<td>${sale.coupon}</td>
			<td>${sale.saleStart}</td>
			<td>${sale.saleEnd}</td>
			<td>${sale.disRequire}</td>
			<td>${sale.dis}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sale/sale.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改" class="sl_sp_badge" style="background-color: #9ac972">
			     <input type="hidden" name="saleID"  value="${sale.saleID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sale/sale.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除" class="sl_sp_badge" style="background-color: #9ac972">
			     <input type="hidden" name="saleID"  value="${sale.saleID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <th>優惠碼ID</th>
                        <th>優惠碼</th>
                        <th>優惠開始日</th>
                        <th>優惠結束日</th>
                        <th>優惠條件</th>
						<th>折抵金額</th>
						<th>修改</th>
						<th>刪除</th>
                    </tr>
                </tfoot>
            </table>
           
        </main>
    </div>

    <div class="footerPage"></div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
    
    <script>
        new DataTable('#example1');
    </script>
    <script>
        // $(".headerPage").load("header.html");
        // $(".footerPage").load("footer.html");
          $(".sidebarPage").load("backendSidebar.html");
    </script>
</body>

</html>