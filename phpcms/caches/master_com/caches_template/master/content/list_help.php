<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<link href="http://jz.faisys.com/css/blog.min.css" rel="stylesheet" type="text/css">
<div class="fk-banner fk-banner-blog">
	<div class="fk-banner-contentWrap">
		<div class="fk-blog-searchFrame">
			<div class="f-searchAreaWrap">
				<input id="keyword" type="text" class="f-searchInput" placeholder="请输入你想了解的问题">
			</div>
			<div class="f-searchIconWrap" onclick="searchBlog();">
				<div class="fk-icon-search"></div>
			</div>
		</div>
	</div> 
</div>

<!-- 页面展示 start -->

	<div class="fk-blogPage fk-blogPage-displayPage" style="display: block;">
		<!-- func start -->
		<div class="fk-blogFunc">
			<div class="f-funcWrap">
				<div class="f-funcBlock f-funcBlock-first">
					<a href="/blog~214.html" target='_blank' class="f-a">
						<div class="fk-funcIcon fk-funcIcon-prod"></div>
						<h3 class="f-funcTitle">产品介绍</h3>
					</a>
				</div>
				<div class="f-funcBlock">
					<a href="/blog~215.html" target='_blank' class="f-a">
						<div class="fk-funcIcon fk-funcIcon-feature"></div>
						<h3 class="f-funcTitle">功能特色</h3>
					</a>
				</div>
				<div class="f-funcBlock">
					<a href="/blog~216.html" target='_blank' class="f-a">
						<div class="fk-funcIcon  fk-funcIcon-domain"></div>
						<h3 class="f-funcTitle">域名使用</h3>
					</a>
				</div>
				<div class="f-funcBlock">
					<a href="/blog~217.html" target='_blank' class="f-a">
						<div class="fk-funcIcon  fk-funcIcon-mobi"></div>
						<h3 class="f-funcTitle">手机网站</h3>
					</a>
				</div>
				<div class="f-funcBlock f-funcBlock-last">
					<a href="/blog~218.html" target='_blank' class="f-a">
						<div class="fk-funcIcon fk-funcIcon-update"></div>
						<h3 class="f-funcTitle">功能更新</h3>
					</a>
				</div>
			</div>
		</div>
		<div class="fk-blogQ" id="normalQestion">
			<dl class="fk-blogQWrap">
				<dt class="f-blogQTitle"><h3>常见问题</h3></dt>
				<dd class="f-blogQItem">
					<div class="f-blogQContentWrap">
						<h3 class="f-blogQContent-title">页面设计</h3>
						<ul class="f-blogQContent-descList">
							<li class="f-blogQContent-descItem"><span class="f-dot"></span><a target="_blank" href="//jz.faisco.com/blog/493">如何使用极速建站功能</a></li>
							<li class="f-blogQContent-descItem"><span class="f-dot"></span><a target="_blank" href="//jz.faisco.com/blog/315">如何更换网站主题</a></li>
							<li class="f-blogQContent-descItem"><span class="f-dot"></span><a target="_blank" href="//jz.faisco.com/blog/7127">如何设置网站横幅</a></li>
						</ul>
					</div>
				</dd>
				<dd class="f-blogQItem">
					<div class="f-blogQContentWrap">
						<h3 class="f-blogQContent-title">模块排版</h3>
						<ul class="f-blogQContent-descList">
							<li class="f-blogQContent-descItem"><span class="f-dot"></span><a target="_blank" href="//jz.faisco.com/blog/1742">如何使用产品导航模块</a></li>
							<li class="f-blogQContent-descItem"><span class="f-dot"></span><a target="_blank" href="//jz.faisco.com/blog/1430">如何把视频转码为MP4格式</a></li>
							<li class="f-blogQContent-descItem"><span class="f-dot"></span><a target="_blank" href="//jz.faisco.com/blog/275">视频转换为flv格式</a></li>
						</ul>
					</div>
				</dd>
				<dd class="f-blogQItem f-blogQItem-last">
					<div class="f-blogQContentWrap">
						<h3 class="f-blogQContent-title">其他</h3>
						<ul class="f-blogQContent-descList">
							<li class="f-blogQContent-descItem"><span class="f-dot"></span><a target="_blank" href="//jz.faisco.com/blog/31">各大搜索引擎收录指引</a></li>
							<li class="f-blogQContent-descItem"><span class="f-dot"></span><a target="_blank" href="//jz.faisco.com/blog/334">收录排名低的原因</a></li>
							<li class="f-blogQContent-descItem"><span class="f-dot"></span><a target="_blank" href="//jz.faisco.com/blog/535">如何在百度站长平台验证网站</a></li>
						</ul>
					</div>
				</dd>
			</dl>
		</div>
		<div class="fk-blogQ fk-blogTool">
			<dl class="fk-blogQWrap fk-blogTWrap">
				<dt class="f-blogQTitle"><h3>常见工具</h3></dt>
				<dd class="f-blogQItem f-blogTItem">
					<a class="f-blogQLink" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3395782885&site=qq&menu=yes">
						<span class="fk-funcIcon fk-funcIcon-psw"></span>
						<span class="f-blogQItem-txt">找回密码</span>
					</a>
				</dd>
				<dd class="f-blogQItem f-blogTItem">
					<a class="f-blogQLink" target="_blank" href="https://whois.aliyun.com/">
						<span class="fk-funcIcon fk-funcIcon-dns"></span>
						<span class="f-blogQItem-txt">域名注册</span>				
					</a>
				</dd>
				<dd class="f-blogQItem f-blogTItem f-blogQItem-last">
					<a class="f-blogQLink" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3395782885&site=qq&menu=yes">
						<span class="fk-funcIcon fk-funcIcon-refeed"></span>
						<span class="f-blogQItem-txt">我要反馈</span>			
					</a>
				</dd>
			</dl>
		</div>
		<!-- func end -->
	</div>

<!-- 页面展示 end -->

<!-- 分类展示 end -->


<!-- 搜索展示 start -->

<!-- 搜索展示 end -->

<?php include template("content","footer"); ?>