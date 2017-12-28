<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?>	<div class="col-left col-1 left-memu">
        	<h5 class="title"><?php echo L('account_manage');?></h5>
            <ul>
				<li <?php if(ROUTE_A=="account_manage") { ?> class="on"<?php } ?>><a href="index.php?m=member&c=index&a=account_manage"><img src="<?php echo IMG_PATH;?>icon/m_3.png" width="14" height="15" /> 用户中心</a></li>
			<li <?php if(ROUTE_A=="member_vip_list") { ?> class="on"<?php } ?>><a href="index.php?m=member&c=index&a=member_vip_list"><img src="<?php echo IMG_PATH;?>icon/m_2.png" width="14" height="15" /> 购买VIP</a></li>
                <li<?php if(ROUTE_A=="account_manage_info") { ?> class="on"<?php } ?>><a href="index.php?m=member&c=index&a=account_manage_info&t=1"><img src="<?php echo IMG_PATH;?>icon/user_edit.png" width="16" /> <?php echo L('modify').L('memberinfo');?></a></li>
                <?php if(0) { ?>
				<li<?php if(ROUTE_A=="account_manage_avatar") { ?> class="on"<?php } ?>><a href="index.php?m=member&c=index&a=account_manage_avatar&t=1"><img src="<?php echo IMG_PATH;?>icon/vcard.png" width="16" /> <?php echo L('modify').L('avatar');?></a></li>
				<?php } ?>
				<?php if(!empty($memberinfo['encrypt'])) { ?>
				<li<?php if(ROUTE_A=="account_manage_password") { ?> class="on"<?php } ?>><a href="index.php?m=member&c=index&a=account_manage_password&t=1"><img src="<?php echo IMG_PATH;?>icon/icon_key.gif" width="16" height="16" /> <?php echo L('modify').L('email');?>/<?php echo L('password');?></a></li>
				<?php } ?>
				<?php if(0) { ?>
				<li<?php if(ROUTE_A=="account_manage_upgrade") { ?> class="on"<?php } ?>><a href="index.php?m=member&c=index&a=account_manage_upgrade&t=1"><img src="<?php echo IMG_PATH;?>icon/Upload.png" />&nbsp;&nbsp;<?php echo L('member').L('allowupgrade');?></a></li>
				<?php } ?>
				<li<?php if(ROUTE_A=="account_change_mobile") { ?> class="on"<?php } ?>><a href="index.php?m=member&c=index&a=account_change_mobile&t=1"><img src="<?php echo IMG_PATH;?>icon/mobile_phone.png" /> <?php echo L('change_mobile');?></a></li>
            </ul>
        <span class="o1"></span><span class="o2"></span><span class="o3"></span><span class="o4"></span>
    </div>