<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div id="memberArea">
<?php include template('member', 'account_manage_left'); ?>
    <div class="col-auto">
	   vip 1 vip2
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript" src="<?php echo JS_PATH;?>cookie.js"></script>
<script language="JavaScript">
<!--
$(document).ready(function() {
	var announcement = getcookie('announcement_<?php echo $memberinfo['userid'];?>_<?php echo $announceid;?>');
	if(announcement==null || announcement=='') {
		$("#announcement").fadeIn("slow");
	}
});
//-->
</script>
<?php include template('member', 'footer'); ?>