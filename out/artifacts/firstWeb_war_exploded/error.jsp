<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2020/6/29
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'error.jsp' starting page</title>
</head>

<body>
<%String username = (String)session.getAttribute("UserID"); %>
error   <%= username %>
</body>
</html>
