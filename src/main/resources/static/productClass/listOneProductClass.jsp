<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.sale.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  Sale sale = (Sale) request.getAttribute("sale");
%>

<html>
<head>
<title>�u�f��� - listOneSale.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�u�f��� - listOneSale.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�u�f�s��</th>
		<th>�u�f�N�X</th>
		<th>�u�f�}�l���</th>
		<th>�u�f�������</th>
		<th>�u�f����</th>
		<th>�����B</th>
	</tr>
	<tr>
		<td><%=sale.getSaleID()%></td>
		<td><%=sale.getCoupon()%></td>
		<td><%=sale.getSaleStart()%></td>
		<td><%=sale.getSaleEnd()%></td>
		<td><%=sale.getDisRequire()%></td>
		<td><%=sale.getDis()%></td>
	
	</tr>
</table>

</body>
</html>