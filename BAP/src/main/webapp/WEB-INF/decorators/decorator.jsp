<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<%@ include file="/WEB-INF/include/header.jsp" %>

<head>
	<title><decorator:title default="BAP page"/></title>
	<decorator:head />
</head>

<decorator:body />

<%@ include file="/WEB-INF/include/footer.jsp" %>
