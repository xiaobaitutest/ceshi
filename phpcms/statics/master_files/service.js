lastScrollY=0;function heartBeat(){}$(function(){var c=0;var b=(document.documentElement.clientHeight-316)*2/5;if(b<0){b=0}if(b>=0||b<=190){b=190}if(typeof _serviceHide!="undefined"&&_serviceHide){}c=20;var d=(function(){var i=null;return{set:g,clear:h,init:f};function f(){h();g()}function h(){}function g(){}}());var a=['<div class="fk-ask-panel">','<div class="f-ask-telWrap">','<div class="fk-icon fk-icon-tel"></div>','<div class="f-tel-txtWrap">','<div class="f-txt">电话咨询</div>','<div class="f-tel">4006-099-500</div>',"</div>","</div>",'<div class="f-ask-qqWrap">','<div class="f-qq-hd">','<div class="fk-icon fk-icon-wx"></div>','<div class="f-qq-txtWrap">QQ咨询</div>',"</div>",'<div class="f-qq-sec">','<div class="f-qq-list">','<a href="javascript:;" class="f-qq-item f-qq-item-before" onclick="window.open(\'http://www.faisco.cn/qq.jsp?s=3\')">售前客服</a>','<a href="javascript:;" class="f-qq-item f-qq-item-after" onclick="window.open(\'http://www.faisco.cn/qq.jsp?s=9\')">售后客服</a>',"</div>","</div>","</div>","</div>"].join("");suspendcode=['<div class="fk-toolArea" id="faiscoService">','<ul class="f-toolList">','<li class="f-toolItem f-toolAskItem f-toolAskItemHover J_askItem disable">','<a class="f-toolBlock">','<i class="f-icon f-icon-ask"></i>',"</a>",'<div class="f-subArea J_subArea">','<div class="fk-ask-panelWrap">',a,"</div>","</div>","</li>",'<li class="f-toolItem f-toolRefeedItem">','<a class="f-toolBlock J_refeedLink" href="http://www.faisco.com/ts.html" target="_blank">','<i class="f-icon f-icon-refeed"></i>','<span class="f-txt">反馈</span>',"</a>","</li>",'<li class="f-toolItem f-toolRebackItem">','<a class="f-toolBlock J_reback" href="javascript:;">','<i class="f-icon f-icon-reback"></i>',"</a>","</li>","</ul>","</div>"];$(suspendcode.join("")).appendTo("body");d.init();var e=(function(){return{dragable:k,rebackable:t,disableReback:v,ableReback:h,initClickRefeedLink:g,ctrlRebackItemDisplay:j,adjustAskPanelPos:f,init:r};function r(){g();p();k();j();$(window).scroll(j);f();m();o()}function m(){var x=$("#faiscoService .J_askItem");x.removeClass("disable")}function i(){var x=$("#faiscoService .J_askItem");x.addClass("disable")}function f(){var B=$(window);var A=$("#faiscoService");var z=B.width();var y=A.offset().left+280;var x=A.find(".f-toolAskItem");if(y>z){x.addClass("left")}else{x.removeClass("left")}}function j(){var z=$(window),x=$("#faiscoService").find(".f-toolRebackItem");var y=(z.scrollTop()>z.height());if(y){x.show()}else{x.hide()}}function g(){var z=$("#faiscoService"),B="click.useLink",y="mousedown.useLink",x="mouseup.useLink",D="mousemove.useLink";var C=$("body");var A=0;z.off(y).on(y,".J_refeedLink",function(F){var E=z;E.data("isDownLink",true);A=0;C.off(D).on(D,function(I){var H=z;var G=H.data("isDownLink");A++;if(G&&A>2){H.data("isMoveLink",true)}})}).off(B).on(B,".J_refeedLink",function(G){C.off(D);var F=z;var E=F.data("isMoveLink");F.removeData("isMoveLink").removeData("isDownLink");if(E){return false}}).off(x).on(x,".J_refeedLink",function(){C.off(D)})}function k(){var I=$("#faiscoService"),H=$("body"),z="mousedown.tool",O="mouseup.tool",Q="mousemove.tool";var J=false,D=false,F,E,N,L;x(I);H.off(z).on(z,"#faiscoService",C);function C(U){if(!D){D=true}var Y=P(U,true);F=Y.x;E=Y.y;var W=I.offset(),X=W.left-$(window).scrollLeft(),V=W.top-$(window).scrollTop();N=F-X;L=E-V;var T=$(U.delegateTarget);T.on(Q,G).on(O,A)}function G(Y){if(D){if(!J){i();J=true;d.clear()}}if(!J){return}var Z=P(Y,true);var U=Z.x,T=Z.y,X=(U-N),W=(T-L),V=$(window).width()-(X+I.width());I.css({right:V,top:W});Y.preventDefault()}function A(){var T=J;D=false;J=false;x($(this));d.set();f();m();if(T){return false}}function x(T){T.off(Q).off(O)}function P(W,V){var U,T;if(V){U=W.clientX;T=W.clientY}else{U=W.pageX;T=W.pageY}return{x:U,y:T}}var R="mousedown.fixBug",y="click.fixBug";I.off(R).off(y).on(R,".f-toolItem",S).on(y,".f-toolItem",B);function S(W){var V=M(W),U=$(this),T="mousemove.fixBug";V.data("isDown",true);V.off(T).one(T,".f-toolItem",K);e.ableReback()}function K(U){var T=M(U);if(T.data("isDown")){e.disableReback();T.data("isMove",true)}}function B(V){var U=M(V),T=U.data("isMove");U.removeData("isDown").removeData("isMove")}function M(T){return $(T.delegateTarget)}}var q=null,n=true;function s(){clearInterval(q)}function w(){var x=$(window).scrollTop();clearInterval(q);q=setTimeout(function(){clearTimeout(q);q=setInterval(function(){x-=x/10;if(x<5){x=0;clearInterval(q);q=null}$(window).scrollTop(x)},1000/60)})}function p(){var z=$("#faiscoService"),B="click.reback",y="mousedown.reback",x="mouseup.reback",D="mousemove.reback";var C=$("body");var A=0;z.off(y).on(y,".J_reback",function(F){var E=z;E.data("isDownLink",true);A=0;C.off(D).on(D,function(I){var H=z;var G=H.data("isDownLink");A++;if(G&&A>2){H.data("isMoveLink",true)}})}).off(B).on(B,".J_reback",function(G){C.off(D);var F=z;var E=F.data("isMoveLink");F.removeData("isMoveLink").removeData("isDownLink");if(!E){w()}}).off(x).on(x,".J_reback",function(){C.off(D)});$("body").on("mousewheel.cancelReback",s)}function t(){}function v(){n=false}function h(){n=true}function l(){return !!n}function o(){var D=isLowIeEnv();var G=$("#faiscoService");var E="mouseenter.askItem";var A="mouseleave.askItem";var y=300;if(D){G.find(".f-toolAskItemHover").removeClass("f-toolAskItemHover").addClass("f-toolAskItemUnHover")}else{return}G.off(A).off(E).on(E,".J_askItem",function(){var I=$(this),J=I.find(".J_subArea"),M=J.find(".fk-ask-panelWrap"),L=J.find(".fk-ask-panel"),K=I.hasClass("left");x(M,L,K)}).on(A,".J_askItem",function(){var I=$(this),J=I.find(".J_subArea"),M=J.find(".fk-ask-panelWrap"),L=J.find(".fk-ask-panel"),K=I.hasClass("left");B(M,L,K)});function F(J,I){J.stop().animate({width:184,paddingLeft:8,paddingRight:8,left:-184},y);I.stop().animate({marginLeft:0},y)}function H(J,I){J.stop().animate({width:0,paddingLeft:0,paddingRight:0,left:0},y);I.stop().animate({marginLeft:0},y,u)}function z(J,I){J.stop().animate({width:184,paddingLeft:8,paddingRight:8},y);I.stop().animate({marginLeft:0},y)}function C(J,I){J.stop().animate({width:0,paddingLeft:0,paddingRight:0},y);I.stop().animate({marginLeft:-184},y,u)}function x(L,K,J){var I=J?F:z;I.apply(null,arguments)}function B(L,K,J){var I=J?H:C;I.apply(null,arguments)}}function u(){var y=$("#faiscoService"),x=y.find(".J_askItem"),z=x.find(".J_subArea"),B=z.find(".fk-ask-panel"),A=z.find(".fk-ask-panelWrap");A.css({width:"",paddingLeft:"",paddingRight:"",left:""});B.css({marginLeft:""})}}());e.init()});cusSayScroll=function(j){var e={pauseDuration:2000,showDuration:800,scrollMode:"up"};var b=e;if(j){b=$.extend({},e,j)}var h=$("#cusSay").children("div.say-item-parent"),i=b.pauseDuration,g=b.showDuration,f=b.scrollMode,a="alwayssay";h.mouseover(function(){Fai.stopInterval(a)}).mouseout(function(){Fai.startInterval(a)});function c(){function k(){if(f=="up"){var l=h.children("div.say-item").first().height();h.animate({top:"-="+l},g,function(){var m=h.children("div.say-item").first();m.appendTo(h).end().hide().fadeIn(400);h.css({top:0});d()})}else{var l=h.children("div.say-item").last().height();h.animate({top:"+="+l},g,function(){var m=h.children("div.say-item").last();m.insertBefore(h.children("div.say-item").first()).end().hide().fadeIn(400);h.css({top:0});d()})}}Fai.addTimeout(a,k,i);Fai.startInterval(a)}function d(){c()}c()};logDog=function(b,a){$.ajax({type:"POST",url:"http://"+portalHost+"/_dogonly.jsp?di="+Fai.encodeUrl(b)+"&ds="+Fai.encodeUrl(a),dataType:"jsonp"})};agentHomeQiao=function(){$("#qiao-icon-group0")[0].click()};function isLowIeEnv(){if(isLowIeEnv.flag!=void 0){return isLowIeEnv.flag}isLowIeEnv.flag=(Fai.isIE9()||Fai.isIE8()||Fai.isIE7()||Fai.isIE6());return isLowIeEnv.flag};