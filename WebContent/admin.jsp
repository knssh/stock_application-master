<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.DB" %>
<%@include file="common/common.jsp"%>
<%
	String userID = (String)request.getSession().getAttribute("userID"); 
	if(!"admin@rutgers.edu".equals(userID)){
		response.sendRedirect("index.jsp");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/<%=contextRoot %>/css/foundation.css" rel="stylesheet">
<link href="/<%=contextRoot %>/css/common.css" rel="stylesheet">
<title>index</title>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<div class="blur-box">
	  <div id="frame" class="row collapse expanded" >

	  </div>
	</div>
	
	<table class='hover'>
	<caption>Users Information</caption>
	<thead>
	  <tr>
	    <th width="50">id</th>
	    <th width="100">Account Name</th>
	    <th width="150">Email</th>
	    <th width="50">Action</th>
	  </tr>
	</thead>
	<tbody>
	<% 
		ArrayList<ArrayList<String>> users = DB.getUsersInfo();
		for(int i=0;i<users.size();i++){
			String id = users.get(i).get(0);
			String username = users.get(i).get(1);
			if("admin".equals(username.trim())) continue;
			String email = users.get(i).get(2);
	%>
			<tr>
			  <td><%= id%></td>
			  <td><%= username%></td>
			  <td><%= email%></td>
			  
			  <td><a data-open="exampleModal<%= id%>" class="radius button">delete&hellip;</a>
			  
<div class="reveal" id="exampleModal<%= id%>" data-reveal>
  <p class="lead">Do you confirm to delete this user?</p>
  <button onclick="confirm_delete(<%= id%>)" class="radius button">Confirm</button>
  <button class="close-button" data-close aria-label="Close modal" type="button">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
			  </td>
			</tr>
	<%
		}
	%>

	</tbody>
	</table>

</body>
<script src="js/vendor/jquery.js"></script>
<script src="js/vendor/foundation.js"></script>
<script src="js/user/user.js"></script>
<script type="text/javascript">
function confirm_delete(id){
	window.location.href="admin?id="+id;
}
</script>



</html>