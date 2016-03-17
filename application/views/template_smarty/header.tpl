<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <script src="js/jquery.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="lottery" content="重庆时时彩, 新疆时时彩, 天津时时彩, 江西11选5, 山东11选5, 广东11选5, 后二大小单双"
    />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>

    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>

    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!--start-smoth-scrolling-->
    <!-- webfonts-->
    <link href='http://fonts.useso.com/css?family=Abel|Lato:300,400,700,300italic,700italic' rel='stylesheet' type='text/css'>
    <!-- webfonts-->
    <!--start-top-nav-scrip-->
    <script>
        $(function() {
            var pull 		= $('#pull');
            menu 		= $('nav ul');
            menuHeight	= menu.height();
            $(pull).on('click', function(e) {
                e.preventDefault();
                menu.slideToggle();
            });
            $(window).resize(function(){
                var w = $(window).width();
                if(w > 320 && menu.is(':hidden')) {
                    menu.removeAttr('style');
                }
            });
        });
    </script>
</head>

<body>
<!-- header -->
    <div class="header">
        <div class="top-header">
            <div class="container">
                <!--logo-->
                <div class="logo">
                    <h1><a href="javascript:void(0)">Statistics</a></h1>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
<!-- top-nav -->
        <div class="mid-head">
            <div class="container">
                <div class="top-nav">
                    <span class="menu"> </span>
                    <ul>
                        <li class="active"><a href="index.html">CQSSC</a></li>
                        <li><a href="about.html">XJSSC</a></li>
                        <li><a href="services.html">TJSSC</a></li>
                        <li><a href="solutions.html">JX11-5</a></li>
                        <li><a href="404.html">SD11-5</a></li>
                        <li><a href="contact.html">GD11-5</a></li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>
            </div>
        </div>
        <!-- script-for-nav -->
        <script>
            $(document).ready(function(){
                $("span.menu").click(function(){
                    $(".top-nav ul").slideToggle(300);
                });
            });
        </script>
    <!-- script-for-nav -->