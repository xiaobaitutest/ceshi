<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
<meta name="keywords" content="<?php echo $SEO['keyword'];?>">
<meta name="description" content="">
<meta name="copyright" content="<?php echo $SEO['keyword'];?>">
<meta http-equiv="Cache-Control" content="no-transform">
<link href="<?php echo TPL_STATIC_PATH;?>mainCss.css" rel="stylesheet" type="text/css">
<link href="<?php echo TPL_STATIC_PATH;?>index.css" rel="stylesheet" type="text/css">
<div class="webHead">
	<div class="head middle_new">
		<a hidefocus="true" class="headLogo" href="#" title="色情网站建设专家">
			<span class="f-img">色情网站建设</span>
		</a>
		<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=b43f1459ac702900c8d44c91a5e796dd&action=category&catid=0&num=25&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'25',));}?>
		<div class="webNav">
			<div class="nav <?php if($top_parentid==0) { ?>navCheck<?php } ?> nav-first">
				<a hidefocus="true" href="#" title="<?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?>">首页</a>
			</div>
			<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
			<div class="nav <?php if($catid==$r[catid] || $top_parentid==$r[catid]) { ?>navCheck<?php } ?> ">
				<a hidefocus="true" href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a>
			</div>
			<?php $n++;}unset($n); ?>
		 <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
		</div>
		<div class="headRight">
			<div class="register">
				<a hidefocus="true" class="reg fk-freeRegBtn" href="/index.php?m=member&c=index&a=register">免费注册</a>
			</div>
			<a hidefocus="true" class="login fk-loginBtn" href="/index.php?m=member&c=index&a=login">登录</a>
		</div>
	</div>
</div>

