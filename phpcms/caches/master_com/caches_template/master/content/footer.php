<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!-- footer -->

<!-- <div id="autoHeightDiv"></div> -->

<!-- <div class="footLineGray"></div>
<div class="lineWhite"></div> -->
<div class="webFoot fk-footer">
	<div class="f-footer-main">
		<div class="f-footer-wrap">
			<div class="f-footer-partWrap">
				
				<div class="f-footer-mainPart f-footer-partner">
					<h3 class="f-footer-mainPart-title">合作伙伴</h3>
					<div class="f-footer-mainPart-content">
						<ul class="f-main-list">
							<li class="f-main-item"><a href="https://www.360.cn/" target="_blank">360</a></li>
							<li class="f-main-item f-main-item-baidu"><a href="http://www.baidu.com/" target="_blank">百度</a></li>
							<li class="f-main-item f-main-item-sogou"><a href="http://www.sogou.com/" target="_blank">搜狗</a></li>
							<li class="f-main-item f-main-item-cft"><a href="https://www.tenpay.com/" target="_blank">财付通</a></li>
							<li class="f-main-item f-main-item-alipay"><a href="https://www.alipay.com/" target="_blank">支付宝</a></li>
							<li class="f-main-item f-main-item-cn"><a href="http://www.ct10000.com/" target="_blank">中国电信</a></li>
						</ul>
					</div>
				</div>
				<div class="f-footer-mainPart f-footer-friendLink">
					<h3 class="f-footer-mainPart-title">友情链接</h3>
					<div class="f-footer-mainPart-content">
						<ul class="f-main-list f-friendLink-list1">
							<li class="f-main-item"><a target="_blank" href="http://jz.faisco.com/">网站建设</a></li>
							<li class="f-main-item"><a target="_blank" href="http://www.sitekc.com/">建站快车</a></li>
							<li class="f-main-item"><a target="_blank" href="#">微信营销</a></li>
							<li class="f-main-item"><a target="_blank" href="#">域名注册</a></li>
							<li class="f-main-item"><a target="_blank" href="#">网站模版</a></li>
						</ul>
						<ul class="f-main-list f-friendLink-list2">
							<li class="f-main-item"><a target="_blank" href="#">网页制作</a></li>
							<li class="f-main-item"><a target="_blank" href="#">手机网站建设</a></li>
							<li class="f-main-item"><a target="_blank" href="#">如何创建网站</a></li>
							<li class="f-main-item"><a target="_blank" href="#">微网站制作</a></li>
							<li class="f-main-item"><a target="_blank" href="#">客户网站</a></li>
						</ul>
					</div>
				</div>			
			</div>
		</div>
	</div>
	<div class="fk-footer-splitLine"></div>
	<div class="foot middle f-foot">
		<div class="footLinks">
			<span><a hidefocus="true" href="">关于小白兔</a></span>
			<span><a hidefocus="true" href="#" 帮助中心</a></span>
			<span><a hidefocus="true" href="#" >支付方式</a></span>
			<span><a hidefocus="true" href="#">服务条款</a></span>
			<span><a hidefocus="true" href="#" rel="nofollow">法律声明</a></span>
			<span><a hidefocus="true" href="#" >企业网站</a></span>
			<span><a hidefocus="true" href="#">省市建站</a></span>
			<span><a hidefocus="true" href="#" >自助建站</a></span>
			<span><a hidefocus="true" href="#" >网站建设</a></span>
			<span><a hidefocus="true" href="#">网站</a></span>
		</div>
		<div class="footCpy">
	
			Copyright <font style="font-family:'微软雅黑';">©</font> 2010-2017 菲律宾小白兔科技股份有限公司 <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow"></a> 
			<a target="_blank" hidefocus="true" href="http://www.itrust.org.cn/Home/Index/itrust_certifi?wm=1639937559" class="fk-trustLink"></a>
		</div>
	</div>
</div>


<!-- service -->
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>jquery-core.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>jquery-ui-core.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>fai.js"></script>
<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>service.js"></script>





<script type="text/javascript" src="<?php echo TPL_STATIC_PATH;?>_dog.js"></script>


<script type="text/javascript">
var portalHost = "www.faisco.cn";
$(function(){	
	// view页也要使用到百度分享，IE下JS会提前加载
	if (document.getElementById("bdshell_js")) {
		document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000);
	}
});
</script>


<!-- cnzz stat -->
<!-- cnzz stat end -->



<script type="text/javascript">
var regCountInterval = 0;
$(function(){
	$(".nav").hover(function(){
		$(".nav").removeClass("navHover");
		$(this).addClass("navHover");
	}, function(){
		$(this).removeClass("navHover");
	});
	
	$(".webRegCount .weixin").hover(function(){
		$(this).attr('_mouseIn', 1);
		var div = $(this).find(".weixinContent").show();
		div.show();
	}, function(){
		$(this).attr('_mouseIn', 0);
		setTimeout(function(){
			var mouseIn = parseInt($('.webRegCount .weixin').attr('_mouseIn'));
			if(mouseIn == 0){
				$('.webRegCount .weixin').find(".weixinContent").hide();
			}
		}, 100);
	});
	$(".webRegCount .weixin .weixinContent").hover(function(){
		$('.webRegCount .weixin').attr('_mouseIn', 1);
	}, function(){
		$('.webRegCount .weixin').attr('_mouseIn', 0);
		setTimeout(function(){
			var mouseIn = parseInt($('.webRegCount .weixin').attr('_mouseIn'));
			if(mouseIn == 0){
				$(".webRegCount .weixin .weixinContent").hide();
			}
		}, 100);
	});
	
	$(".webRegCount .phone").hover(function(){
		$(this).attr('_mouseIn', 1);
		var div = $(this).find(".phoneContent").show();
		div.show();
	}, function(){
		$(this).attr('_mouseIn', 0);
		setTimeout(function(){
			var mouseIn = parseInt($('.webRegCount .phone').attr('_mouseIn'));
			if(mouseIn == 0){
				$('.webRegCount .phone').find(".phoneContent").hide();
			}
		}, 100);
	});
	$(".webRegCount .phone .phoneContent").hover(function(){
		$('.webRegCount .phone').attr('_mouseIn', 1);
	}, function(){
		$('.webRegCount .phone').attr('_mouseIn', 0);
		setTimeout(function(){
			var mouseIn = parseInt($('.webRegCount .phone').attr('_mouseIn'));
			if(mouseIn == 0){
				$(".webRegCount .phone .phoneContent").hide();
			}
		}, 100);
	});
	if ( $('.regCountMiddle').length != 0 ){
		regCountInterval = window.setInterval(regCountShow, 30);
	}
	
	footAutoHeight();
});

function footAutoHeight(){
	if ($('.footLineGray').length != 0){	
		var footHeightDifference = document.documentElement.clientHeight - ($('.footLineGray').offset().top + 2 + $('.webFoot').height());
		if ( footHeightDifference > 0 ){
			$('#autoHeightDiv').css("height", footHeightDifference);
		}
	}
}

/**function regCountShow(){
	var left1 = $('#regCountText1')[0].offsetLeft;
	var left2 = $('#regCountText2')[0].offsetLeft;
	//console.log(left1 + "  " + left2);
	if ( --left1 == 0 ){
		$('#regCountText1').css("left", left1);
		$('#regCountText2').css("left", 320);
		return;
	}
	if ( --left2 == 0 ){
		$('#regCountText1').css("left", 320);
		$('#regCountText2').css("left", left2);
		return;
	}
	//console.log(left1 + "  " + left2);
	$('#regCountText1').css("left", left1);
	$('#regCountText2').css("left", left2);
}**/

</script>
<style type="text/css">
#qiao-icon-wrap {display:none !important;}
</style>

<style type="text/css">
#bdshare_l { box-shadow:none;}
</style>

<script language="javascript" type="text/javascript">

var timeout         = 3000;
var closetimer		= 0;
var _resRoot 	= 'http://jz.faisys.com';
var bannerOver = false;
var bannerCount = 5;
var bannerIndex = 1;
var showBannerDZ = false;

var saysTimer = 0;
var saysTimeout = 4000;
var saysIndex = 1;
var saysOver = false;

var promoteInterval = 0;
var promoteWidth = 0;
var Fkjz = {};
$(function(){
    var imgList = [
        'ani_panel.png',
        'ani_bg.jpg',
        'ani_bRect.png',
        'ani_bRect_m.png',
        'ani_sidePanel.png',
        'ani_mRect.png',
        'ani_sRect.png',
        'bnr1_txt.png',
        'ani_sRect_bar1.png',
        'ani_mRect_line1.png',
        'ani_panel_list.png',
        'ani_sRect_circle.png',
        'ani_sRect_bar2.png',
        'ani_mRect_line2.png',
        'ani_pinkCircle.png',
        'ani_yellowCircle_line.png',
        'ani_pinkCircleShadow.png',
        'ani_yellowCircle.png',
        'ani_pinkCircle_line.png',
        'ani_yellowCircleShadow.png',
        'ani_bRect_circle.png'
    ];

    Fkjz.runIdxBnrAnimate = runAnimate;

    initBanner();
    
    function initBanner(){
        var $aniBanner = $(".fk-idxBnr-animate");
        if(Fai.isIE6()){
            $aniBanner.addClass('fk-idxBnr-animate-static');
            $aniBanner.children().remove();
        }else{
            runAnimate();   
        }    
    }
    function runAnimate(){
        var canUseAnimate = isSupportAnimate();
        var $idxBnr = $('.fk-idxBnr-animate');
        
        if(canUseAnimate){
            $idxBnr.removeClass('init').removeClass('start');

            $idxBnr.addClass('init');//初始化动画
            loadAnimateElem(imgList, function(){

                setTimeout(function(){
                    //执行动画
                    $idxBnr.addClass('start');
                });

            });
        
        }else{
            //使用静态图
            $idxBnr.addClass('static');
            $idxBnr.addClass('fk-idxBnr-animate-static');
        }

    }
    
    function getAbsSrc(src){
        return _resRoot + "/image/v2/index/" + src;
    }
    //首屏横幅动画处理
    function loadAnimateElem(imgList, callback){
        var loadedCount = 0;
        var listener = function(){
            loadedCount ++;
            if(loadedCount >= imgList.length){
                callback && callback();
            } 
        };
        $(imgList).each(function(index, src){
            src = getAbsSrc(src);//获取绝对路径;
            //判断图片是否已经加载过
            if(isLoaded(src)){
                listener();
            }else{//如果图片未加载过，则进行加载监听
                var $img = $("<img>");
                $img.attr('src', src);
                //是否存在两个回调都触发的情况?
                $img.load(listener).error(listener);
            }
        });
    }
    function isLoaded(src){
        var img = new Image;
        img.src = src;
        return img.complete === true;
    }
    


    //图片是否加载完成
    //图片是否加载过
    //图片是否加载失败

    //是否支持animate
    function isSupportAnimate(){
        var $elem = $('<div></div>');

        $elem.css('animationName', 'test');

        return ( $elem.css('animationName') === 'test' );
    }
});

$(function(){


    $(".webRegCount").find(".regCountLeft").css({"margin-left":"0"});
 
	$('#webBanner_index .btn').hover(function(){
		if (Fai.isIE6()){
			$(this).css("filter", "alpha(opacity=100)");
		} else {
			$(this).animate({opacity:"1"}, 300);
		}
	}, function(){
		if (Fai.isIE6()){
			$(this).css("filter", "alpha(opacity=50)");
		} else {
			$(this).animate({opacity:"0.5"}, 300);
		}
	});
	
	$('.modelDiv').hover(function(){
		$(this).find('.hoverLink').show();
		if ( $(this).find(".hoverText2").is(":animated") ){
			$(this).find(".hoverText2").stop();
		}
		$(this).find('.hoverText2').fadeIn();
	}, function(){
		$(this).find('.hoverLink').hide();
		if ( $(this).find(".hoverText2").is(":animated") ){
		   $(this).find(".hoverText2").stop();
		}
		$(this).find('.hoverText2').fadeOut();
	});
	
	$('.caseAndModel_index .commDiv').hover(function(){
		if (Fai.isIE6()){
			$(this).find(".tradeDiv").css("filter", "alpha(opacity=80)");
		} else {
			if ( $(this).find(".tradeDiv").is(":animated") ){
				$(this).find(".tradeDiv").stop();
			}
			$(this).find(".tradeDiv").animate({opacity:"0.8"}, 300);
		}
	}, function(){
		if (Fai.isIE6()){
			$(this).find(".tradeDiv").css("filter", "alpha(opacity=0)");
		} else {
			if ( $(this).find(".tradeDiv").is(":animated") ){
				$(this).find(".tradeDiv").stop();
			}
			$(this).find(".tradeDiv").animate({opacity:"0"}, 300);
		}
	});
	
	$('.caseAndModel_index .titleDiv').hover(function(){
		$('.titleDiv').removeClass("titleDiv_check");
		$(this).addClass("titleDiv_check");
		if ( $(this).hasClass("caseTitleDiv") ){
			$('#caseContent').show();
			$('#mobiCaseContent').hide();
			$('#caseMore').show();
			$('#mobiCaseMore').hide();
		} else {
			$('#caseContent').hide();
			$('#mobiCaseContent').show();
			$('#caseMore').hide();
			$('#mobiCaseMore').show();
		}
	}, function(){
		
	});
	
	$('#mobiCaseContent .smallImg').hover(function(){
		var index = $(this).attr("id").replace(/[^\d]/g, "");
		$('#mobiCaseContentBigImg').removeClass().addClass("bigImg" + index);
	}, function(){
		
	});
	
	$('.feature').on("click", function(){
		$.openURL("http://jz.faisco.com/reg.html", "_blank");
	});
	$('.feature').hover(function(){
		$(this).addClass("feature-hover");
	}, function(){
		$(this).removeClass("feature-hover");
	});
	
	saysTimer = setTimeout(saysContentDisplay, saysTimeout);
	$('.clientSays_index .list').on("mouseover", ".saysLink", function(){
		var id = $(this).attr("id").replace(/[^\d]/g, "");
		if ( saysIndex != id ){
			saysContentShow(id);
		}
	});
	$('.clientSays_index').hover(function(){
		clearTimeout(saysTimer);
		saysOver = true;
	}, function(){
		saysOver = false;
		saysTimer = setTimeout(saysContentDisplay, saysTimeout);
	});
	//saysContentDisplay(saysIndex);
	
	closetimer = window.setTimeout(bannerDisplay, timeout);
	$(".webBanner_index").mouseover(function(){
		bannerOver = true;
		window.clearTimeout(closetimer);
	}).mouseleave(function(){
		bannerOver = false;
		closetimer = setTimeout(bannerDisplay, timeout);
	});	
	//bannerDisplay();
	$("#bannerLinkImg").show();
	
	$("#webBanner_index").hover(function(){
		$(this).find(".prevBtn").css("left", "0px");
		$(this).find(".nextBtn").css("right", "0px");
	}, function(){
		$(this).find(".prevBtn").css("left", "-25px");
		if (Fai.isIE6()){
			$(this).find(".nextBtn").css("right", "-26px");
		} else {
			$(this).find(".nextBtn").css("right", "-26px");
		}
	})
	
	$('.promote_index .linkDiv a').each(function(index, element) {
        promoteWidth += $(this).outerWidth();
    });
	$('.promote_index .linkDiv').css("width", promoteWidth).css("padding-right", 920).css("padding-left", 920);
	$('.promote_index .content').scrollLeft(920);
	promoteInterval = window.setInterval(promoteScroll, 30);
	$('.promote_index .content').hover(function(){
		window.clearInterval(promoteInterval);
	}, function(){
		promoteInterval = window.setInterval(promoteScroll, 30);
	});
	
	$("#fkjzVideoLittleClose").click(function(){
		$("#fkjzVideoBg,#fkjzVideoPreBox").remove();
	});
	
	$('#fkjzVideoPreBox').click(function(){
		$('#fkjzVideoBg').show();
		document.getElementById('fkjzVideo').play();
	});
	$('.fkjzVideoClose').click(function(){
		$('#fkjzVideoBg').hide();
		document.getElementById('fkjzVideo').pause();
	});
    $("#fkjzVideo")
        .bind("play", function(){
            logDog(200059, 0);   // 视频点击播放次数
        })
        .bind("ended", function(){
            logDog(200059, 1);   // 视频播放完成次数
        });
});

function logDog(dogId, dogSrc){
    $.ajax({
        type:'GET',
        url:'/ajax/log_h.jsp?cmd=dog&dogId=' + Fai.encodeUrl(dogId) + '&dogSrc=' + Fai.encodeUrl(dogSrc)
    });
}

function bannerShow(id){
	if ( $('.bannerLink').is(":animated") ){
		return;
	}
	if ( id == -1 ){
		id = --bannerIndex;
		if ( id < 1 ){
			id = bannerCount;
			bannerIndex = bannerCount;
		}
		$('#bannerLink' + bannerIndex).css("left", "-480px");
		$('.bannerLink').animate({left: "+=480px"}, 300);
	} else if ( id == -2 ){
		id = ++bannerIndex;
		if ( id > bannerCount ){
			id = 1;
			bannerIndex = 1;
		}
		$('#bannerLink' + bannerIndex).css("left", "480px");
		$('.bannerLink').animate({left: "-=480px"}, 300);
	} else {
		$('#bannerLink' + bannerIndex).css("left", "480px");
		$('.bannerLink').animate({left: "-=480px"}, 300);
	}
	/*if( id == 2){
		if(!showBannerDZ){
			logDog(4000067, 31);   // JZ官网首页-代建广告-曝光量
			showBannerDZ = true;
		}
	}*/
	
	window.clearTimeout(closetimer);
	if (!bannerOver){
		closetimer = window.setTimeout(bannerDisplay, timeout);
	}
}

function bannerDisplay(){
	bannerIndex++;
	if ( bannerIndex > bannerCount ) {
		bannerIndex=1;
	}
	bannerShow( bannerIndex );
}

function saysBoxChange(id){
	var saysLink = $('#saysLink' + id);

    if(!saysLink[0]){ return; }

	var left = saysLink[0].offsetLeft + 1;
	var top = saysLink[0].offsetTop + 1;
	$('#saysBox').css("left", left).css("top", top);
	var link = saysLink.attr("href");
	$('#saysBox').attr("href", link);
}

function saysContentDisplay(){
	saysIndex++;
	if ( saysIndex > 8 ) {
		saysIndex = 1;
	}
	saysContentShow( saysIndex );
}

function saysContentShow(id){
	saysIndex = id;	
	saysBoxChange(id);
	if ( $('.clientSays_index .content .contentDiv').is(":animated") ){
		$('.clientSays_index .content .contentDiv').stop();
	}
	$('.clientSays_index .content .contentDiv').fadeOut();
	$('.clientSays_index .content #saysContent' + id).fadeIn();
	clearTimeout(saysTimer);
	if ( !saysOver ){
		saysTimer = setTimeout(saysContentDisplay, saysTimeout);
	}
}

function searchKeyword(){
	if ( $('#searchInput').val() == "" ){
		alert("请输入您想搜索的内容");
		$('#searchInput').focus();
		return;
	} else {
		window.open("http://jz.faisco.com/blog.html?w=" + Fai.encodeUrl($('#searchInput').val()));
	}
}

function promoteScroll(){
	var tmp = $('.promote_index .content');
	var left = tmp.scrollLeft();
	if ( left == 920 + promoteWidth ){
		tmp.scrollLeft(0);
	} else {
		tmp.scrollLeft(++left);
	}
}


// index js
$(function(){

    initTabs();//初始化所有的tabs
    initFocusList();//初始化所有的焦点列表
    initGuestSld();
    // tabs功能
    function initTabs(){
        var $tabsCollection = $('.fk-index-tabs');
        $tabsCollection
            .off("click.swtichTab")
            .on("click.swtichTab", '.f-tab', swtichTabs); 

        //初始化滑动条
        $tabsCollection.each(function(index, tabs){
            var $tabs = $(tabs);
            $line = $tabs.find('.f-tab-activeLine');
            $curTab = $tabs.find('.f-tab-active'); 
            $line.css(getTabActiveLineCss($tabs));
        })  
    }

    function swtichTabs(e){
        var $tabs = $(e.delegateTarget);//获取委托对象
        var $curTab = $(this);
        var $allTab = $tabs.find('.f-tab');
        var $line = $tabs.find('.f-tab-activeLine');

        $allTab.removeClass("f-tab-active");
        $curTab.addClass("f-tab-active");

        $line.animate(getTabActiveLineCss($tabs), 300);

        if($tabs.attr("sld-id") === "modelSld"){
            if($curTab.index() === 1){
                $('#modelSld').height(1100);
            }else{
                $('#modelSld').height(872);
            }
        }

        swtichSlider($tabs.attr("sld-id"), $curTab.index());
    }
    function getTabActiveLineCss($tabs){
        var $line = $tabs.find('.f-tab-activeLine'),
            $curTab = $tabs.find('.f-tab-active');

        return {
            left: $curTab.position().left + (parseInt($curTab.css("margin-left")) || 0 ),
            top: $curTab.position().top + $curTab.outerHeight(),
            width: $curTab.outerWidth(),
            height: 2
        };
    }


    function swtichSlider(panelId, index){
        var $sldPanel = $('#'+panelId);
        if($sldPanel.length === 0){ return; } 
        var $sldList = $sldPanel.find('.f-sldList');
        var sldLen = $sldList.find(".f-sldItem").length;
        if(sldLen <= 1){ return; }

        var util_w = $sldPanel.outerWidth();
        var offset_w = -Math.abs(util_w*index);

        $sldList.stop().animate({
            left: offset_w
        },300);
    }

    function initFocusList(){
        var $allfocus = $('.fk-index-focus');
        $allfocus.off("click.swtichFocus")
            .on("click.swtichFocus", '.f-focusItem', switchFocus);
        initFocusItemAnimate($allfocus);
    }

    function switchFocus(e){
        var $focus = $(e.delegateTarget),
            $allFocusItem = $focus.find(".f-focusItem"),
            $curFocusItem = $(this),
            activeCls = "f-focusItem-active";

        setFocusItemAniamte( activeCls, $allFocusItem, $curFocusItem); 

        swtichSlider($focus.attr("sld-id"), $curFocusItem.index());

        if($curFocusItem.index() === 0){
            Fkjz.runIdxBnrAnimate();
        }

    }
    function setFocusItemAniamte(activeCls, $allItem, $curItem){
        var time = 300;
        var isLowIE = isLowIeEnv();

        if(isLowIE){

            $curItem.siblings().stop().animate({
                width: 16
            }, time);

            $curItem.stop().animate({
                width: 50
            }, time);

        }else{
            $allItem.removeClass(activeCls);
            $curItem.addClass(activeCls);
        }
    }
    function initFocusItemAnimate($focusList){
        var isLowIE = isLowIeEnv();
        var activeCls = "f-focusItem-active";
        var $curItem = $focusList.find('.'+ activeCls);

        if(isLowIE){
           $curItem.removeClass(activeCls);
           $curItem.css({width: 50});
        }else{  
           $curItem.addClass(activeCls);
        }
    }

    function initGuestSld(){
        var $guest = $('.f-index-guest');

        var index = 0;
        $guest.off("click.switchGuestSld")
            .on("click.switchGuestSld", '.f-btn-left, .f-btn-right', function(){
                var $btn = $(this),
                    isLeft = $btn.hasClass('f-btn-left'),
                    MAX_LEN = $('#guestWinSld').find('.f-sldItem').length;
                    


                if(isLeft){
                    if(index == 0){
                        index = MAX_LEN-1;
                        swtichSlider('guestWinSld', index);
                        swtichSlider('guestTxtWinSld', index);
                        return ;
                    }
                    index--;
                }else{
                    if(index == MAX_LEN - 1){
                        index = 0;
                        swtichSlider('guestWinSld', index);
                        swtichSlider('guestTxtWinSld', index);
                        return ;
                    }
                    index++;
                }

                if(index<0){
                    index = 0;
                }

                if(index > MAX_LEN-1){
                    index = MAX_LEN-1;
                }

                swtichSlider('guestWinSld', index);
                swtichSlider('guestTxtWinSld', index);

            });
    } 

    initNumberBar();
    function initNumberBar(){
        var isInited = false,
            $window = $(window);
        $window
            .off("scroll.initNumberBar")
            .on("scroll.initNumberBar", function(){
                var $window = $(this);
                if(isInited){
                    $window.off("scroll.initNumberBar");
                    return ;
                    isInited = null;
                }


                var $numberBar = $("#numberBar"),
                    n_top = $numberBar.offset().top,
                    win_scrollTop = $(this).scrollTop(),
                    win_height = $(this).height(),
                    isInView = (n_top - win_scrollTop < win_height &&  n_top - win_scrollTop > 0);

                if(isInView){
                    isInited = true;

                    changeNumberBarNum();
                }
        });
        
        $window.trigger("scroll.initNumberBar");

    }



    function changeNumberBarNum(){
        var $numBar = $('#numberBar');

        var ssTime = 1500;
        var startTime = new Date().getTime();
        var isSsEnd = false;
        var timer = setInterval(function(){
            var currTime = new Date().getTime();
            var per = (currTime - startTime)/ssTime;

            if(per>1){
                per = 1;
                isSsEnd = true;
            }

            updateSsNumber(per);
            updateSafeNumber(per);
            updateCoverNumber(per);
            updateDayNumber(per);

            if(isSsEnd){
                clearInterval(timer);
            }

        }, 1000/60);

        var total = parseInt( '14,615,165'.split(',').join('') ) || 0;

        function updateSsNumber(per){
            var ssTotalNum = total;
            var $siteServiceNum = $('#numberBar').find('.f-siteServiceNum');
            var currNum = parseInt( ssTotalNum * per );
            currNum = n2q( currNum );

            $siteServiceNum.text( currNum );
        }
        function updateSafeNumber(per){
            var $safeNum = $('#numberBar').find('.f-numberItem-safeRun .f-num');
            var total = 2589;
            var currNum = parseInt(total*per) ;

            $safeNum.text(currNum);
        }
        function updateCoverNumber(per){
            var $coverNum = $('#numberBar').find('.f-numberItem-cover .f-num');
            var total = 100;
            var currNum = parseInt(total*per) ;

            $coverNum.text(currNum);
        }

        function updateDayNumber(per){
            var $dayNum = $('#numberBar').find('.f-numberItem-day .f-num');
            var total = 7;
            var currNum = parseInt(total*per) ;

            $dayNum.text(currNum);
        }

    }
    function n2q(a){
        var arr = (a + '').split(''),
            strArr = [],
            l = arr.length;

        for(var i=l-1; i>=0; i--){

            strArr.unshift( arr[i] );

            if( i !== 0 && (l-i)%3 === 0 ){
                strArr.unshift(',') ;  
            }
            
        }
        return strArr.join('');
    }

    //判断是否是特殊版本的IE
    function isLowIeEnv(){
        //use flag cache
        if(isLowIeEnv.flag != void 0){
            return isLowIeEnv.flag;
        }

        isLowIeEnv.flag = (Fai.isIE9() || Fai.isIE8() || Fai.isIE7() || Fai.isIE6() );
        
        return isLowIeEnv.flag ;
    }

    //init main animate
    initMainBlcokListAnimate(); 
    /*
    低版本替换动画的实现方案：
    1、若原生支持，使用CSS方案(使用类名做动画的开关)
    2、若原生不支持，则csshover无过渡效果，把hover类名剔除，统一使用$dom.aniamte()实现
     */
    function initMainBlcokListAnimate(){
        var $list = $('#mainBlcokList'),
            $items = $list.find('.f-main-item'),
            isLowIE = isLowIeEnv();

        if(!isLowIE){
            return ;
        }else{//把hover相关的类名删除
            $items.removeClass('f-main-itemHover');
        }

        var enterEvtName = 'mouseenter.ieAniamte' ;
        var leaveEvtName = 'mouseleave.ieAniamte' ;
        var time = 300;

        $list.off(enterEvtName)
            .on(enterEvtName, '.f-main-item', function(){
                var $item = $(this);
                var $icon = getIcon($item);
                var $faiscoBg = getFasicoBg($item);
                var $infoWrap = getInfoWrap($item);
                var $wrapBg = getWrapBg($item);
                var $name = getName($item);
                $icon.stop().animate({
                    opacity: 0
                }, time);

                $faiscoBg.stop().animate({

                    height: 159,
                    width: 236,
                    left: -45,
                    top: -13,
                    'border-bottom-left-radius': 0,
                    'border-bottom-right-radius': 0,
                    'border-top-left-radius': 20,
                    'border-top-right-radius': 20

                }, time);

                $infoWrap.stop().animate({
                    opacity: 1
                }, time);

                $wrapBg.stop().animate({
                    
                    width: 236,
                    height: 318,
                    left: -45,
                    top: -13,
                    'border-bottom-left-radius': 20,
                    'border-bottom-right-radius': 20,
                    'border-top-left-radius': 20,
                    'border-top-right-radius': 20

                }, time, function(){
                    $wrapBg.css('box-shadow', '0 0 10px 0 rgba(0,0,0,0.15)');
                }); 

                $name.stop().animate({
                    opacity: 0
                });
            
            }).on( leaveEvtName, '.f-main-item', function(){
                var $item = $(this);
                var $icon = getIcon($item);
                var $faiscoBg = getFasicoBg($item);
                var $infoWrap = getInfoWrap($item);
                var $wrapBg = getWrapBg($item);
                var $name = getName($item);

                $icon.stop().animate({
                    opacity: 1
                }, time);

                $faiscoBg.stop().animate({
                    width: 146,
                    height: 146,
                    left: 0,
                    top: 0,
                    'border-bottom-left-radius': 40,
                    'border-bottom-right-radius': 40,
                    'border-top-left-radius': 40,
                    'border-top-right-radius': 40

                }, time);

                $infoWrap.stop().animate({
                    opacity:0
                }, time);

                $wrapBg.stop().animate({
                    width: 146,
                    height: 146,
                    'border-bottom-left-radius': 0,
                    'border-bottom-right-radius': 0,
                    'border-top-left-radius': 0,
                    'border-top-right-radius': 0,
                    left: 0,
                    top: 0

                }, time, function(){
                    $wrapBg.css('box-shadow', '');
                }); 

                $name.stop().animate({
                    opacity: 1
                });
            });

        //获取图标
        function getIcon($item){
            return $item.find('.f-infoIcon');
        }
        function getFasicoBg($item){
            return $item.find('.f-infoBlock-fasico .f-bg');
        }
        function getInfoWrap($item){
            return $item.find('.fk-infoBlockWrap .f-infoWrap');
        }
        function getWrapBg($item){
            return $item.find('.fk-infoBlockWrap .f-wrapBg');
        } 
        function getName($item){
            return $item.find('.f-infoBlock-name');
        }

        
    }

    initMobiModelAnimate();
    function initMobiModelAnimate(){
        var $list = $('#caseMobiList');
        var $items = $list.find('.f-item');
        var enterEvtName = 'mouseenter.enterMobiCase';
        var leaveEvtName = 'mouseleave.leaveMoveCase';
        var time = 300;
        var isLowIE = isLowIeEnv();


        if(isLowIE){
            $items.find('.fk-index-screenHover')
                .removeClass('fk-index-screenHover')
                .addClass('fk-index-screenUnHover');
        }else{
            return;
        }

        $list.off(enterEvtName)
            .off(leaveEvtName)
            .on( enterEvtName, '.f-item', function(){

                var $item = $(this);
                var $screen = getScreen($item);
                initScreen($screen, $item);

            });


        function getScreen($item){
            return $item.find('.f-screen');
        }

        function initScreen($screen, $item){
            var enterEvt = "mouseenter.enterScreen";
            var mouseEvt = "mousemove.enterScreen";
            var leaveEvt = "mouseleave.leaveScreen";
            var evtData = {
                $item : $item
            };

            releaseScreenEnterEvt($screen);

            $screen
                .off(leaveEvt)
                .on( enterEvt, function(){
                    releaseScreenEnterEvt(this);
                    enterScreen.apply(this, arguments);
                }).one( mouseEvt, function(){
                    releaseScreenEnterEvt(this);
                    enterScreen.apply(this, arguments);
                }).on( leaveEvt, leaveScreen );
        }
        function enterScreen(e){
            var $screen = $(this);
            var $qrCode = getQrCode($screen);
            var $button = getButton($screen);

            $qrCode.stop().animate({
                top: 75
            }, time);

            $button.stop().animate({
                opacity:1
            }, time);

        }
        function leaveScreen(){
            var $screen = $(this);
            var $qrCode = getQrCode($screen);
            var $button = getButton($screen);

            $qrCode.stop().animate({
                top: -144
            }, time);

            $button.stop().animate({
                opacity:0
            }, time);

        }
        function releaseScreenEnterEvt(screen){
            var enterEvt = "mouseenter.enterScreen";
            var mouseEvt = "mousemove.enterScreen";
            var $screen = $(this);
            $screen.off(enterEvt)
                .off(mouseEvt);

        }
        function getQrCode($screen){
            return $screen.find('.f-qrCode');
        }
        function getButton($screen){
            return $screen.find('.f-btn-preview');
        }

    }

    initPcModelAnimate();
    function initPcModelAnimate(){
        var $list = $('#pcCaseList');
        var $items = $list.find('.fk-casePc-formWrapHover');
        var enterEvt = "mouseenter.enterPc";
        var leaveEvt = "mouseleave.leavePc";
        var time = 300;
        var isLowIE = isLowIeEnv();

        if(isLowIE){
            $items.removeClass('fk-casePc-formWrapHover')
                .addClass('fk-casePc-formWrapUnHover');
        }else{
            return;
        }

        $list.off(enterEvt)
            .off(leaveEvt)
            .on(enterEvt, '.fk-casePc-formWrap', function(){
                var $mask = $(this).find('.f-winMask');

                $mask.stop().animate({
                    opacity: 0.6
                }, time); 

            }).on(leaveEvt, ".fk-casePc-formWrap", function(){
                var $mask = $(this).find('.f-winMask');

                $mask.stop().animate({
                    opacity: 0
                }, time); 
            
            });
    } 
    

    $(window).resize(fixIndexBannerSlide);
    function fixIndexBannerSlide(){
        var index = $('.fk-banner-index').find('.f-focusItem-active').index() || 0;
        var $sld = $('#baner-sld');
        var $list = $sld.find('.f-sldList');

        $list.css('left', -$sld.outerWidth() * index);
    }
    //帮助中心
    initHelpCenterTab();
});
function initHelpCenterTab(){
    var $tabs = $('.fk-index-header .fk-index-tabs');
    $tabs.on("mouseenter.changeTab", '.f-tab', function(){
        var $item = $(this);
         $item.click();
    });
}

</script>




<div class="fk-toolArea" id="faiscoService"><ul class="f-toolList"><li class="f-toolItem f-toolAskItem f-toolAskItemHover J_askItem left"><a class="f-toolBlock"><i class="f-icon f-icon-ask"></i></a><div class="f-subArea J_subArea"><div class="fk-ask-panelWrap"><div class="fk-ask-panel"><div class="f-ask-telWrap"><div class="fk-icon fk-icon-tel"></div><div class="f-tel-txtWrap"><div class="f-txt">电话咨询</div><div class="f-tel">4006-099-500</div></div></div><div class="f-ask-qqWrap"><div class="f-qq-hd"><div class="fk-icon fk-icon-wx"></div><div class="f-qq-txtWrap">QQ咨询</div></div><div class="f-qq-sec"><div class="f-qq-list"><a href="javascript:;" class="f-qq-item f-qq-item-before" onclick="window.open('http://www.faisco.cn/qq.jsp?s=3')">售前客服</a><a href="javascript:;" class="f-qq-item f-qq-item-after" onclick="window.open('http://www.faisco.cn/qq.jsp?s=9')">售后客服</a></div></div></div></div></div></div></li><li class="f-toolItem f-toolRefeedItem"><a class="f-toolBlock J_refeedLink" href="http://www.faisco.com/ts.html" target="_blank"><i class="f-icon f-icon-refeed"></i><span class="f-txt">反馈</span></a></li><li class="f-toolItem f-toolRebackItem" style="display: none;"><a class="f-toolBlock J_reback" href="javascript:;"><i class="f-icon f-icon-reback"></i></a></li></ul></div></body></html>