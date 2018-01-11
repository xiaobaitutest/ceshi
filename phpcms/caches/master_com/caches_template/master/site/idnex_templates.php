<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
    <!-- header section end-->
    <div class="wrapper">
    <div class="row">
        <div class="col-sm-12">
            <section class="panel">
                <!--search start-->
                <div id="select_list" class="panel-body" style="padding-top: 25px">
                     <form id="form" class="form-horizontal" action="#" method="post">
                        <div class="col-md-11">
                            <div class="form-group">
                                <label class="control-label col-md-1">开始时间：</label>
                                <div class="col-md-2">
                                    <input class="form-control" id="stime" size="16" type="text" name="stime" placeholder="开始时间">
                                </div>
                                <label class="control-label col-md-1">结束时间：</label>
                                <div class="col-md-2">
                                    <input class="form-control" id="etime" size="16" type="text" name="etime" placeholder="结束时间">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-1" style="width: 50px;">
                            <div class="col-sm-10" style="float: right">
                                <a class="btn btn-info" onclick="game.search_data();">查询</a>
                            </div>
                        </div>
                    </form>
                </div>
                <!--search end-->
            </section>
            <div id="list"><section class="panel">
 
</section>
<div class="row">
    <div class="col-lg-6">
        <div id="editable-sample_info" class="dataTables_info">Showing 1 to 2 of  entries</div>
    </div>
            <div class="col-lg-6">
            <div class="dataTables_paginate paging_bootstrap pagination">
                <ul>
                    <li class="prev disabled"><a onclick="pagetion(1)">← Prev</a></li>
                    <li class="prev disabled"><a onclick="pagetion(1)">First</a></li>              
                        <li class="active"><a onclick="pagetion(1)">1</a></li>
                                        <li class="next disabled"><a onclick="pagetion(1)">Last</a></li>
                    <li class="next disabled"><a onclick="pagetion(1)">Next → </a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
    </div>
</div>
    <!--body wrapper end-->
    <script type="text/javascript">
        $(document).ready(function () {
        	$("#stime,#etime").datetimepicker({format: 'yyyy-mm-dd hh:ii:ss ',minView:2});
            $.post('index.php?m=member&c=site&a=lists_templates',{},function (res) {
                $("#list").html(res);
            })
        })
        var site={};
        site.list=function () {
            $("#form").ajaxSubmit({
                url: 'index.php?m=member&c=site&a=lists_templates',
                data: {dosubmit: 1},
                success: function (res) {
                    $("#list").empty().html(res);
                }
            });
        }
		
        site.search_data=function () {
        	site.list();
        }
		addSite= function(id) {
			"use strict";
			dialogWin({title:'修改密码',url:'index.php?m=member&c=site&a=add_site',data:{id:id},width:680,divId:'epd',closeBtn:true,
				btns: {name:'提交',style:'btn-success',callback:"doAddSite(epd)"}
			},function(winf){});
		};
		doAddSite=function(winf){
			$(winf).find("form").validate(function () {
				$(winf).find("form").ajaxSubmit({
					url: 'index.php?m=member&c=site&a=doAddSite',
					data: {dosubmit: 1},
					dataType: 'json',
					success: function (r) {
						console.log(r.status);
						if (r.status == 0) {
							$(winf).modal('hide');
							site.list();
						}else{
							alert("修改失败");
						}
					}
				});
			});
		};
        var pagetion=function(p){
            $("#form").ajaxSubmit({
                url: 'index.php?m=member&c=site&a=lists_templates',
                data: {dosubmit: 1,page:p},
                success: function (res) {
                    $("#list").empty().html(res);
                }
            });
        }
    </script>
    </div>
<?php include template('member', 'footer'); ?>
