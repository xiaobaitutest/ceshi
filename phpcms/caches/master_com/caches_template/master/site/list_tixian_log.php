<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><section class="panel">
    <div class="panel-body">
      <div class="table_content">
        <table class="table table-striped">
            <thead>
            <tr>
                <th width="8%">提现ID</th>
				<th width="10%">提现金额</th>
				<th width="8%">是否受理</th>
				<th width="15%">备注</th>
				<th width="15%">申请时间</th>
				<th width="15%">受理时间</th>
            </tr>
            </thead>
            <tbody>
             <?php $n=1;if(is_array($infos)) foreach($infos AS $info) { ?> 
                    <tr>
                        <tr>
                           <td width="8%"><?php echo $info['id']+10000;?></td>
							<td  width="10%" align="center"><?php echo $info['amount'];?></td>
							<td  width="10%" align="center"><?php echo $info['note'];?></td>
							<td width="8%" align="center"><?php if($info['is_deal']){echo '<font color="#FF0000">已受理</font>';}else{ echo '<font color="green">未受理</font>';} ?></td>
							<td width="15%" align="center"><?php echo date('Y-m-d H:i:s',$info['log_time']);?> </td>
							<td width="15%" align="center"><?php if(!empty($info['deal_time'])){ echo date('Y-m-d H:i:s',$info['deal_time']);}else{ echo '';} ?> </td>
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
