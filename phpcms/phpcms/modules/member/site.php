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
		//parent::__construct();
		$this->MYSQLDUMP_PATH='/app/mysql/bin/mysqldump';
		$this->MYSQL_PATH='/app/mysql/bin/mysql';
		$this->storage_path='/app/mysql';
		$this->site_list_db= pc_base::load_model('sitelist_model');
		$this->master_site_list_db= pc_base::load_model('master_sitelist_model');
		$this->membertixian_db= pc_base::load_model('membertixian_model');
		$this->memberbank_db= pc_base::load_model('memberbank_model');
		$this->membermoneylog= pc_base::load_model('membermoneylog_model');
		$this->master_membermoneylog= pc_base::load_model('master_membermoneylog_model');
		parent::__construct();
	}
	
	function set_config($config, $config_dir,$filename="system") {
		$CACHE_PATH=PHPCMS_PATH.'caches/'.$config_dir.DIRECTORY_SEPARATOR;
		$configfile = $CACHE_PATH.'configs'.DIRECTORY_SEPARATOR.$filename.'.php';
		if(!is_writable($configfile)) showmessage('Please chmod '.$configfile.' to 0777 !');
		$pattern = $replacement = array();
		foreach($config['default'] as $k=>$v) {
			if(in_array($k,array('js_path','css_path','img_path','attachment_stat','admin_log','gzip','errorlog','phpsso','phpsso_appid','phpsso_api_url','phpsso_auth_key','phpsso_version','connect_enable', 'upload_url','sina_akey', 'sina_skey', 'snda_enable', 'snda_status', 'snda_akey', 'snda_skey', 'qq_akey', 'qq_skey','qq_appid','qq_appkey','qq_callback','admin_url','database'))) {
				$v = trim($v);
				$configs[$k] = $v;
				$pattern[$k] = "/'".$k."'\s*=>\s*([']?)[^']*([']?)(\s*),/is";
	        	$replacement[$k] = "'".$k."' => \${1}".$v."\${2}\${3},";
				
			}
		}
		$str = file_get_contents($configfile);
		$str = preg_replace($pattern, $replacement, $str);
		return pc_base::load_config('system','lock_ex') ? file_put_contents($configfile, $str, LOCK_EX) : file_put_contents($configfile, $str);		
	}
	public function load_config($file,$config_dir, $key = '', $default = '', $reload = false) {
		if (!$reload && isset($configs[$file])) {
			if (empty($key)) {
				return $configs[$file];
			} elseif (isset($configs[$file][$key])) {
				return $configs[$file][$key];
			} else {
				return $default;
			}
		}
		$CACHE_PATH=PHPCMS_PATH.'caches/'.$config_dir.DIRECTORY_SEPARATOR;
		$path = $CACHE_PATH.'configs'.DIRECTORY_SEPARATOR.$file.'.php';	
		if (file_exists($path)) {
			$configs[$file] = include $path;
		}
		if (empty($key)) {
			return $configs[$file];
		} elseif (isset($configs[$file][$key])) {
			return $configs[$file][$key];
		} else {
			return $default;
		}
	}
	//url : http://www.test.com/index.php?m=site&c=index&a=create_site&url=http://aa.com&demo_id=1
	public function create_site(){
		//判断url 是否合法
		$url=$_GET['url'];
		if($this->CheckUrl($url)){
		}else{
			echo 'url is not igeall';die();
		}
		if(!isset($_GET['demo_id'])){
			echo 'demo_id i needed';die();
		}
		$demo_id=intval($_GET['demo_id']);
		$where = "`id`='$demo_id'";
		$res=$this->site_list_db->get_one($where);
		//复制数据库
		$old_db_name=$res['db_name'];
		$new_db_name=$this->get_db_name($url);
		$this->copy_database($old_db_name,$new_db_name);
		$this->copy_config($old_db_name,$new_db_name);
		//ruku
		$data[user_id]=1;
		$data[db_name]=$new_db_name;
		$data[site_name]='wangzhang';
		$data[is_demo]=0;
		$data[url]=$_GET['url'];
		$this->site_list_db->insert($data,true);die();
	}
	function get_db_name($url){
		$host_url = str_replace('-', '_', $url);
		$host_url = str_ireplace('https://', '', $host_url);
		$host_url = str_ireplace('http://', '', $host_url);
		$host_url = str_ireplace('www.', '', $host_url);
		$host_url = strtolower($host_url);	
		$host_url = str_replace('.', '_', $host_url);
		return $host_url;
	}
    function CheckUrl($C_url){  
		$str="/^http(s?):\/\/(?:[A-za-z0-9-]+\.)+[A-za-z]{2,4}(?:[\/\?#][\/=\?%\-&~`@[\]\':+!\.#\w]*)?$/";  
		if (!preg_match($str,$C_url)){  
			return false;  
		}else{  
			return true;  
		}  
	}
	private function copydir($source, $dest)
	{
		if (!file_exists($dest)) mkdir($dest);
		$handle = opendir($source);
		while (($item = readdir($handle)) !== false) {
			if ($item == '.' || $item == '..') continue;
			$_source = $source . '/' . $item;
			$_dest = $dest . '/' . $item;
			if (is_file($_source)) copy($_source, $_dest);
			if (is_dir($_source)) $this->copydir($_source, $_dest);
		}
		closedir($handle);
	}
	private function copy_config($config_from,$config_to){ 
		   $config_from_path=PHPCMS_PATH.'caches/'.$config_from.DIRECTORY_SEPARATOR;
		   $config_to_path=PHPCMS_PATH.'caches/'.$config_to.DIRECTORY_SEPARATOR;
		   $this->copydir($config_from_path, $config_to_path);
		   //
		   $config=$this->load_config('database',$config_to);
		   $config['default']['database']=$config_to;
		   $this->set_config($config,$config_to,'database');
		    $configs=$this->load_config('database',$config_to);
			var_dump( $configs);
		   
	}
	private function copy_database($db_from,$db_to){
		$filename = "backup-" .date('y_m_d_h_i_s'). '_' . $db_from . ".sql";
		$mysql_user_name='root';
		$mysql_password='P@ssw0rd1';
		$mysql_host='127.0.0.1';
		$db_sql='CREATE DATABASE IF NOT EXISTS '.$db_to;
		$this->site_list_db->query($db_sql);
        $command = $this->MYSQLDUMP_PATH . " --user=" . $mysql_user_name . " --password=" . $mysql_password . " --host=" . $mysql_host . " " . $db_from . "  > " . $this->storage_path . "/" . $filename;
		$returnVar = NULL;
        $output = NULL;
        exec($command, $output, $returnVar);
		if (!$returnVar) {
            //导入文件并删除文件
            $command = $this->MYSQL_PATH . " --user=" .  $mysql_user_name . " --password=" . $mysql_password . " --host=" . $mysql_host . " " . $db_to . "  < " . $this->storage_path . "/" . $filename;
            $returnVar = NULL;
            $output = NULL;
            exec($command, $output, $returnVar);
			unlink($this->storage_path . "/" . $filename);
			return true;
        } else {
            return false;
        }
	}
	public function site_list(){
		$userid=$this->memberinfo[userid];
		$site_list_db = pc_base::load_model('site_list_model');
		$where='user_id='.$userid;
		$page = isset($_POST['page']) && intval($_POST['page']) ? intval($_POST['page']) : 1;
		$infos = $site_list_db->listinfo($where,$order = 'id DESC',$page, $pages = '2'); 
		$member_pages = $site_list_db->member_pages;		
		include template('site', 'site_list');
	}
	public function json_return($status,$msg){
		$arr['status']=$status;
		$arr['msg']=$msg;
		echo json_encode($arr);die();
	}
	public function edit_domain(){
		$userid=$this->memberinfo[userid];
		if(isset($_POST['dosubmit'])){
			$_POST[id]=6;
			$arr=array();
			if(!isset($_POST['site_name'])||empty($_POST['site_name'])){
				$this->json_return(1,'网站名称必须填写');
			}
			if(!isset($_POST['id'])||empty($_POST['id'])){
				$this->json_return(1,'网站id必须填写');
			}
			$id=$_POST[id];
			$where='user_id='.$userid.' and id='.$id;	
			$r=$site_list_db->get_one($where,'site_name');
			if(empty($r)){
				$this->json_return(1,'网站不属于你');
			}
			$res=$site_list_db->update(array('id'=>$id), array('site_name'=>$_POST['site_name']));
			$arr['status']='0';
			$arr['msg']='ok';
			echo json_encode($arr);die();
		}else{
			$_POST[id]=6;
			$id=$_POST[id];
			$site_list_db = pc_base::load_model('site_list_model');
			$where='user_id='.$userid.' and id='.$id;	
			$r=$site_list_db->get_one($where,'site_name');
			if(empty($r)){
				$this->json_return(1,'网站不属于你');
			}
			$site_name=$r[site_name];
			include template('site', 'edit_domain');
		}
	}
	public function idnex_templates(){
		include template('site', 'idnex_templates');
	}
	public function lists_templates(){
		$where='1=1';
		if(isset($_GET['type']) && empty($_GET['type'])){
			$where=$whre.' and type='.$_GET['type'];
		}
		include template('site', 'list_templates');
	}
	public function add_site(){
		$_POST['site_name']='test';
		$_POST['dosubmit']=1;
		$userid=$this->memberinfo[userid];
		if(isset($_POST['dosubmit'])){
			if(!isset($_POST['site_name'])||empty($_POST['site_name'])){
				$this->json_return(1,'网站名称必须填写');
			}
			$site_list_db=pc_base::load_model('site_list_model');
			$member_db=pc_base::load_model('member_model');
			$memberinfo = $member_db->get_one(array('userid'=>$userid));
			$number_created = $site_list_db->count(array('user_id'=>$userid));
			if($number_created>=$memberinfo['site_num']){
				$this->json_return(1,'你最多能创建'.$memberinfo['site_num'].'个网站，你网站已经超过数量');
			}
			
		}else{
			include template('site', 'add_site');
		}
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
	public function index_tixian_log(){
		include template('site', 'index_tixian_log');
	}
	public function list_tixian_log(){
		$userid=$this->memberinfo[userid];
		$site_list_db = pc_base::load_model('member_tixian_model');
		$where='user_id='.$userid;
		$page = isset($_POST['page']) && intval($_POST['page']) ? intval($_POST['page']) : 1;
		$infos = $site_list_db->listinfo($where,$order = 'id DESC',$page, $pages = '8');
		$member_pages = $site_list_db->member_pages;
		include template('site', 'list_tixian_log');
	}
	public function index_member_money_log(){
		include template('site', 'index_member_money_log');
	}
	public function  list_member_money_log(){
		$userid=$this->memberinfo[userid];
		$site_list_db = pc_base::load_model('member_money_log_model');
		$where='site_owner_id='.$userid;
		$page = isset($_POST['page']) && intval($_POST['page']) ? intval($_POST['page']) : 1;
		$infos = $site_list_db->listinfo($where,$order = 'id DESC',$page, $pages = '8');
		foreach($infos as $key=>$val){
			$infos[$key][soruce]=self::get_source($infos[$key][type]);
		}
		$member_pages = $site_list_db->member_pages;
		include template('site', 'list_member_money_log');
	}
	
}
?>