<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Global JS-->
    <script src="${cp}/assets/js/jquery-1.10.2.min.js"></script>
    <script src="${cp}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${cp}/assets/plugins/navgoco/jquery.navgoco.min.js"></script>
    <script src="${cp}/assets/plugins/waypoints/waypoints.min.js"></script>
    <script src="${cp}/assets/plugins/switchery/switchery.min.js"></script>
    <script src="${cp}/assets/js/application.js"></script>
    <!--Page Level JS-->
    <script src="${cp}/assets/plugins/countTo/jquery.countTo.js"></script>
    <script src="${cp}/assets/plugins/weather/js/skycons.js"></script>
    <!-- FlotCharts  -->
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.resize.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.canvas.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.image.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.categories.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.crosshair.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.errorbars.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.fillbetween.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.navigate.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.pie.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.selection.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.stack.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.symbol.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.threshold.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.colorhelpers.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.time.min.js"></script>
    <script src="${cp}/assets/plugins/flot/js/jquery.flot.example.js"></script>
    <!-- Morris  -->
    <script src="${cp}/assets/plugins/morris/js/morris.min.js"></script>
    <script src="${cp}/assets/plugins/morris/js/raphael.2.1.0.min.js"></script>
    <!-- Vector Map  -->
<%--     <script src="${cp}/assets/plugins/jvectormap/js/jquery-jvectormap-1.2.2.min.js"></script> --%>
    <script src="${cp}/assets/plugins/jvectormap/js/jquery-jvectormap-world-mill-en.js"></script>
    <!-- ToDo List  -->
    <script src="${cp}/assets/plugins/todo/js/todos.js"></script>
  
    <!--Page Leve JS -->
    <script src="${cp}/assets/plugins/dataTables/js/jquery.dataTables.js"></script>
    <script src="${cp}/assets/plugins/dataTables/js/dataTables.bootstrap.js"></script>    
    
    <!--Load these page level functions-->
    <script>
    $(document).ready(function() {
        app.timer();
        app.map();
        app.weather();
        app.morrisPie();
    });
    </script>