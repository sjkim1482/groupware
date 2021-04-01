<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>

<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SpaceLab</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<%@include file="/WEB-INF/views/common/common_lib.jsp"%>
   
</head>

<body class="off-canvas">
    <div id="container">
        <tiles:insertAttribute name="header"/>
       
        <tiles:insertAttribute name="left" />
       
        <!--main content start-->
        <section class="main-content-wrapper">
            <section id="main-content">
                <!--tiles start-->
                <tiles:insertAttribute name="body" />
            </section>
        </section>
    </div>
    <!--main content end-->
    
    <tiles:insertAttribute name="right"/>
<%@include file="/WEB-INF/views/common/global_lib.jsp"%>



</body>

</html>
