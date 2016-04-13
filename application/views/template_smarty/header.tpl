<!DOCTYPE HTML>
<html>
<head>
    <title>Lottery</title>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <link href="/css/bootstrap-datetimepicker.min.css" rel='stylesheet' type='text/css' />
    <link href="/css/style.css" rel='stylesheet' type='text/css' />
    <script src="/js/jquery.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="lottery" content="重庆时时彩, 新疆时时彩, 天津时时彩, 江西11选5, 山东11选5, 广东11选5, 后二大小单双"
    />
    {literal}
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script type="text/javascript" src="/js/move-top.js"></script>
    <script type="text/javascript" src="/js/easing.js"></script>
    <script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>

    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!--
    <link href='http://fonts.useso.com/css?family=Abel|Lato:300,400,700,300italic,700italic' rel='stylesheet' type='text/css'>
    -->
    <script>
        $(function() {
            var pull    = $('#pull');
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
        {/literal}
    </script>
</head>

<body>
<!-- header -->
    <div class="header">
        <div class="top-header">
            <div class="container">
                <!--logo-->
                <div class="logo">
                    <h1><a href="javascript:void(0)">Lottery  </a><small>Money Maker</small></h1>
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
                        <li class={if $type eq 'cqssc'}"active"{else}""{/if}><a href="/">CQSSC</a></li>
                        <li class={if $type eq 'xjssc'}"active"{else}""{/if}><a href="/home/index/xjssc">XJSSC</a></li>
                        <li class={if $type eq 'tjssc'}"active"{else}""{/if}><a href="/home/index/tjssc">TJSSC</a></li>
                        <li class={if $type eq 'jx11x5'}"active"{else}""{/if}><a href="/home/index/jx11x5">JX11-5</a></li>
                        <li class={if $type eq 'sd11x5'}"active"{else}""{/if}><a href="/home/index/sd11x5">SD11-5</a></li>
                        <li class={if $type eq 'gd11x5'}"active"{else}""{/if}><a href="/home/index/gd11x5">GD11-5</a></li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>
            </div>
        </div>
        <!-- script-for-nav -->
        <script>
            {literal}
            $(document).ready(function(){
                $("span.menu").click(function(){
                    $(".top-nav ul").slideToggle(300);
                });
            });
            {/literal}
        </script>
    <!-- script-for-nav -->