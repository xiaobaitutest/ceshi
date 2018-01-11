<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><section class="panel">
    <div class="panel-body">
      <div class="table_content">
        <table class="table table-striped">
            <thead>
            <tr>
          <!--  <th width="5%"><input type="checkbox" value="" id="check_box" onclick="selectall('messageid[]');"></th> -->
            <th width="10%">收入金额</th>
            <th width="8%">收入来源</th>
            <th width="15%">用户名字</th>
            <th width="15%">网站ID</th>
			<th width="30%">入账时间</th>
            </tr>
            </thead>
            <tbody>
             <?php $n=1;if(is_array($infos)) foreach($infos AS $info) { ?> 
				<tr>
				 <!--<td width="5%" align="center"><input type="checkbox" name="messageid[]" value="<?php echo $info['messageid'];?>"></td>-->
				<td  width="10%" align="center"><?php echo $info['money'];?></td>
				<td width="8%" align="center"><?php echo $info['soruce'];?></td>
				<td width="15%" align="center"><?php echo $info['user_name'];?></td>
				<td width="15%" align="center"><?php echo $info['site_id'];?></td>
				<td width="30%" align="center"><?php echo date('Y-m-d H:i:s',$info['ctime']);?></td>
				</tr>
			<?php $n++;}unset($n); ?>
            </tbody>
        </table>
    </div>
  </div>
</section>
<div id="paginationFormat">
	<div class="row">
			<?php echo $member_pages;?>
	</div>
</div>
