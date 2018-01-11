<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><section class="panel">
    <div class="panel-body">
      <div class="table_content">
        <table class="table table-striped">
            <thead>
            <tr>
                <th width="8%">站点ID</th>
				<th width="10%">站点名称</th>
				<th width="8%">站点地址</th>
				<th width="15%">创建时间</th>
				<th width="15%">状态</th>
				<th width="30%">操作</th>
            </tr>
            </thead>
            <tbody>
             <?php $n=1;if(is_array($infos)) foreach($infos AS $info) { ?> 
                    <tr>
                        <tr>
                           <td width="8%"><?php echo $info['id'];?></td>
							<td  width="10%" align="center"><?php echo $info['site_name'];?></td>
							<td width="8%" align="center"><a href="<?php echo $info['url'];?>"><?php echo $info['url'];?></td>
							<td width="15%" align="center"><?php echo date('Y-m-d H:i:s',$info['ctime']);?> </td>
							<td width="15%" align="center">正常</td>
							<td width="30%" align="center"><a href="<?php echo $info['url'];?>/admin.php">[访问后台]</a><a href="#">[更改域名]</a><a href="#" onclick="editDomain(<?php echo $info['id'];?>)">[更改网站名称]</a></td>
                        </tr>
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
