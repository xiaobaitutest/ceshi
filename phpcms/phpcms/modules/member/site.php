<?php
/**
 * 会员前台投稿操作类
 */

defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_app_class('foreground');
pc_base::load_sys_class('format', '', 0);
pc_base::load_sys_class('form', '', 0);
pc_base::load_app_func('global', 'member');

class site extends foreground {
	private $times_db;
	function __construct() {
		
		parent::__construct();
	}
	public function site_list(){
		$userid=$this->memberinfo[userid];
		$site_list_db = pc_base::load_model('site_list_model');
		$where='user_id='.$userid;
		$page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;
		//$site_lists=$site_list_db->listinfo($where);
		$infos = $site_list_db->listinfo($where,$order = 'id DESC',$page, $pages = '8'); 
		//$membermodelinfo = $this->db->get_one(array('userid'=>$this->memberinfo['userid']));
		$pages = $this->message_db->pages;
		include template('site', 'site_list');
	}
	public function get_source($type){
		switch($type){
			case 1:
				return '充值';
			case 2:
				return '充值';
			case 3:
				return '升级会员';
			default:
				return 'unkown';
		}
	}
	public function tixian_log(){
		$userid=$this->memberinfo[userid];
		$site_list_db = pc_base::load_model('member_money_log_model');
		$where='site_owner_id='.$userid;
		$page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;
		//$site_lists=$site_list_db->listinfo($where);
		$infos = $site_list_db->listinfo($where,$order = 'id DESC',$page, $pages = '8');
		foreach($infos as $key=>$val){
			$infos[$key][soruce]=self::get_source($infos[$key][type]);
		}
		//$membermodelinfo = $this->db->get_one(array('userid'=>$this->memberinfo['userid']));
		$pages = $this->message_db->pages;
		include template('site', 'tixian_log');
	}
	public function member_money_log(){
		$userid=$this->memberinfo[userid];
		$site_list_db = pc_base::load_model('member_money_log_model');
		$where='site_owner_id='.$userid;
		$page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;
		//$site_lists=$site_list_db->listinfo($where);
		$infos = $site_list_db->listinfo($where,$order = 'id DESC',$page, $pages = '8');
		foreach($infos as $key=>$val){
			$infos[$key][soruce]=self::get_source($infos[$key][type]);
		}
		//$membermodelinfo = $this->db->get_one(array('userid'=>$this->memberinfo['userid']));
		$pages = $this->message_db->pages;
		include template('site', 'member_money_log');
		
	}
}
?>