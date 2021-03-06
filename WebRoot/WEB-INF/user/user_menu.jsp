<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  </head>
<nav class="navbar navbar-inverse" style="border-radius: 0;">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="${pageContext.request.contextPath}/index/statistialChart">首页</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/printFile/list.do">打印文档</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/myOrder/unfinished">我的订单</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/cloudStorage/list.do">我的云盘</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/myWallet/balance">我的钱包</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/interChange/list.do">交流中心</a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="javascript:;">欢迎来到女院云打印系统</a></li>
                            <li><a href="${pageContext.request.contextPath}/personal/myinfo">${username}</a></li>
                            <li><a href="${pageContext.request.contextPath}/exit/toLogin">退出</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>