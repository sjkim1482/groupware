<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

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
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${cp}/assets/js/html5shiv.js"></script>
    <script src="${cp}/assets/js/respond.min.js"></script>
    <![endif]-->  
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<!-- 	<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
	
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
    
</head>

<body class="animated fadeIn">
    <section id="login-container">
	
        <div class="row">
            <div class="col-md-3" id="login-wrapper">
                <div class="panel panel-primary animated flipInY">
                    <div class="panel-heading">
                        <h3 class="panel-title">     
                           Sign In
                        </h3>      
                    </div>
                    <div class="panel-body">
                       <p> Login to access your account.</p>
                       
                        <form action="${cp}/QR/dologin" method="post" class="form-horizontal" role="form">
                            <div class="form-group">
                                <div class="col-md-12">
	                                <input type="text" class="form-control" id="email" name="emp_id" value="admin" placeholder="아이디를입력해주세요.">
<!--                                     <input type="text" class="form-control" id="emp_id" name="emp_id" placeholder="empid"> -->
                                    <i class="fa fa-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                               <div class="col-md-12">
                                    <input type="password" class="form-control" id="password" name="pass" value="adminPass1!" placeholder="비밀번호를입력해주세요.">                                   
                                    <i class="fa fa-lock"></i>
                                    <a href="javascript:void(0)" class="help-block">Forgot Your Password?</a>
                                </div>
                            </div>
                            <div class="form-group">
                               <div class="col-md-12">
                               		<input type="submit" class="btn btn-primary btn-block" value="Sign in">
                                   <!--  <a href="index.jsp" class="btn btn-primary btn-block">Sign in</a> -->
                                    <hr />
                                    <a href="pages-sign-up.html" class="btn btn-default btn-block">Not a member? Sign Up</a>
                                </div>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!--Global JS-->
    <script src="${cp}/assets/js/jquery-1.10.2.min.js"></script>
    <script src="${cp}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${cp}/assets/plugins/waypoints/waypoints.min.js"></script>
    <script src="${cp}/assets/js/application.js"></script>
    
    
</body>

</html>