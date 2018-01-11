<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!DOCTYPE html>
<html lang="en" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths" style="overflow: hidden;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="BX software">
<link rel="shortcut icon" href="#" type="/image/png">
<title><?php echo SITE_NAME;?> - 用户中心</title>
<link rel="stylesheet" type="text/css" href="<?php echo TPL_STATIC_PATH;?>member_css/style.css">
<link rel="stylesheet" type="text/css" href="<?php echo TPL_STATIC_PATH;?>member_css/style-responsive.css">
<link rel="stylesheet" type="text/css" href="<?php echo TPL_STATIC_PATH;?>member_css/datetimepicker.css">
<link rel="stylesheet" type="text/css" href="<?php echo TPL_STATIC_PATH;?>member_css/DT_bootstrap.css">
<link rel="stylesheet" type="text/css" href="<?php echo TPL_STATIC_PATH;?>member_css/datetimepicker-custom.css">
<link rel="stylesheet" type="text/css" href="<?php echo TPL_STATIC_PATH;?>member_css/tree-style.css">
<link rel="stylesheet" type="text/css" href="<?php echo TPL_STATIC_PATH;?>member_css/webb.css">
<link rel="stylesheet" type="text/css" href="<?php echo TPL_STATIC_PATH;?>member_css/uploadfile.css">
</head>
<body class="sticky-header" style="">
<section>
    <!-- left side start-->
<div class="left-side sticky-left-side" tabindex="5000" style="overflow: hidden; outline: none;">

    <!--logo and iconic logo start-->
    <div class="logo">
        <a href="#"><img src="http://www.spread.com/promoters/game/index" alt=""></a>
    </div>

    <div class="logo-icon text-center">
        <a href="#"><img src="./files/logo_icon.png" alt=""></a>
    </div>
    <div class="left-side-inner">
        <ul class="nav nav-pills nav-stacked custom-nav">
               <li class=""><a href="#" style="background-image: none;"><i class="fa fa-home"></i> <span>主  页</span></a></li>
               <li class="menu-list ">
				    <a href="javascript:void(0);"><i class="fa fa-user"></i><span>站点管理</span></a>
                    <ul class="sub-menu-list" style="display: none;">
                        <li><a href="index.php?m=member&c=site&a=site_list">网站列表</a></li>
                    </ul>
                </li>
				<li class="menu-list ">
				    <a href="javascript:void(0);"><i class="fa fa-user"></i><span>模板列表</span></a>
                    <ul class="sub-menu-list" style="display: none;">
                        <li><a href="index.php?m=member&c=site&a=idnex_templates&type=1">小说网站</a></li>
						<li><a href="index.php?m=member&c=site&a=idnex_templates&type=2">视频网站</a></li>
						<li><a href="index.php?m=member&c=site&a=idnex_templates&type=3">导航网站</a></li>
                    </ul>
                </li>
				<li class="menu-list ">
				    <a href="javascript:void(0);"><i class="fa fa-user"></i><span>流水管理</span></a>
                    <ul class="sub-menu-list" style="display: none;">
                        <li><a href="index.php?m=member&c=site&a=index_member_money_log">收入流水</a></li>
						<li><a href="index.php?m=member&c=content&a=publish">银行卡绑定</a></li>
						<li><a href="index.php?m=member&c=content&a=publish">申请提现</a></li>
						<li><a href="index.php?m=member&c=site&a=index_tixian_log">提现记录</a></li>
                    </ul>
                </li> 
        </ul>
        <!--sidebar nav end-->
    </div>
</div>
<!-- left side end-->

    <script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/echarts.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/modernizr.min.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/scripts.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/jquery.dataTables.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/DT_bootstrap.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/jquery.form.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/add_modal.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/validate.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/tree.min.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/spinner.min.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/clipboard.min.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>member_js/jquery.uploadfile.min.js"></script>
    <!-- main content start-->
    <div class="main-content">
            <!-- header section start-->
    <div class="header-section">

        <!--toggle button start-->
        <a class="toggle-btn"><i class="fa fa-bars"></i></a>
        <!--toggle button end-->

        <!--notification menu start -->
        <div class="menu-right">
            <ul class="notification-menu">
                <li>
                    <a href="http://www.spread.com/promoters/game/index#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <div id="notice_num">
                            <!--<span  class="badge">4</span>-->
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-head pull-right">
                        <h5 class="title">消息提醒</h5>
                        <div>
                            <ul class="dropdown-list normal-list" id="notice_list">
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="http://www.spread.com/promoters/game/index#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <img src="./files/user-avatar.png" alt="">
                            <label class="role">小A</label>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                        <!--<li><a href="#"><i class="fa fa-user"></i>  Profile</a></li>-->
                        <li><a href="http://www.spread.com/promoters/bind/updatePasswd"><i class="fa fa-cog"></i> 修改密码</a></li>
                        <li><a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=logout"><i class="fa fa-sign-out"></i> 登出</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <audio id="audioPlay" src="/audio/message.wav" hidden="true"></audio>
    </div>
 <script type="text/javascript">
    editPassword= function() {
        "use strict";
        dialogWin({title:'修改密码',url:'#',data:{},width:680,divId:'epd',closeBtn:true,
            btns: {name:'提交',style:'btn-success',callback:"doEditPassword(epd)"}
        },function(winf){});
    };

    doEditPassword=function(winf){
        $(winf).find("form").validate(function () {
            $(winf).find("form").ajaxSubmit({
                url: '#',
                data: {dosubmit: 1},
                success: function (r) {
                    if (r.status == 0) {
                        $(winf).modal('hide');
                        window.location.href='#';
                    }else{
                        alert("修改失败");
                    }
                }
            });
        });
    };
    </script> 