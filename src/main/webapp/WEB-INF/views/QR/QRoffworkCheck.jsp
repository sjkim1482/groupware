<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>

<html class="no-js">

<head>
	 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SpaceLab</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="${cp}/assets/img/favicon.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${cp}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Fonts from Font Awsome -->
    <link rel="stylesheet" href="${cp}/assets/css/font-awesome.min.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="${cp}/assets/css/animate.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="${cp}/assets/css/main.css">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <!-- Feature detection -->
    <script src="${cp}/assets/js/modernizr-2.6.2.min.js"></script>

 <!-- Favicon -->
 	<link rel="shortcut icon" href="${cp}/assets/img/favicon.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${cp}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Font Icons -->
    <link rel="stylesheet" href="${cp}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${cp}/assets/css/simple-line-icons.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="${cp}/assets/css/animate.css">
    <!-- Switchery -->
    <link rel="stylesheet" href="${cp}/assets/plugins/switchery/switchery.min.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="${cp}/assets/css/main.css">
    <!-- Vector Map  -->
    <link rel="stylesheet" href="${cp}/assets/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css">
    <!-- ToDos  -->
    <link rel="stylesheet" href="${cp}/assets/plugins/todo/css/todos.css">
    <!-- Morris  -->
    <link rel="stylesheet" href="${cp}/assets/plugins/morris/css/morris.css">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <!-- Feature detection -->
    <script src="${cp}/assets/js/modernizr-2.6.2.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
</head>
<script type="text/javascript">

// 	var Interval = setInterval(goBack, 3000);	
	
// 	function goBack(){
// 		window.history.back(-3);
// 	}
	
</script>
	<body>
	
	<c:choose>
		<c:when test="${checkempno != 0 }">
			<section id="login-container">
	
		        <div class="row">
		            <div class="col-md-4" id="login-wrapper">
		                <div class="panel panel-primary animated flipInY">
		                    <div class="panel-heading" style="text-align:center;">
				                <c:choose>
				                    <c:when test="${qroffworkcheck == 1 }">
				                        <h3 class="panel-title">     
				                         	????????????
				                        </h3>      
				                    	
				                    </c:when>
									<c:otherwise>
										<h3 class="panel-title">     
				                         	????????????
				                        </h3>  
									</c:otherwise>
								</c:choose>
										
		                    </div>
		                    <div class="panel-body" style="text-align : center;">
		                       <div class="row">
		
									<c:choose>
										<c:when test="${qroffworkcheck == 1 }">
											<!-- 			<h2>?????? ??????</h2> -->
											<img style="width: 160%; height: 400%"
												src="${cp }/image/??????.gif">
										</c:when>
										<c:otherwise>
											<img style="width: 160%; height: 400%"
												src="${cp }/image/??????.png">
										</c:otherwise>
									</c:choose>
		
								</div>
		                        
		                    </div>
		                </div>
		            </div>
		        </div>

    </section>
		
		</c:when>
		<c:otherwise>
		
		<section id="login-container">
	
	        <div class="row">
	            <div class="col-md-4" id="login-wrapper">
	                <div class="panel panel-primary animated flipInY">
	                    <div class="panel-heading" style="text-align:center;">
							<h3 class="panel-title">QR?????? ??????</h3>  		
	                    </div>
	                    <div class="panel-body" style="text-align : center;">
	                       <div class="row">
								<img style="width: 160%; height: 400%" src="${cp }/image/??????.png">
							</div>
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
	
	    </section>
		
		</c:otherwise>
	</c:choose>
	
    <!--Global JS-->
    <script src="${cp}/assets/js/jquery-1.10.2.min.js"></script>
    <script src="${cp}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${cp}/assets/plugins/waypoints/waypoints.min.js"></script>
    <script src="${cp}/assets/js/application.js"></script>
    
</body>
</html>