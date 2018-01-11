<?php
defined('IN_PHPCMS') or exit('No permission resources.');
class index {
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
	function copydir($source, $dest)
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
	function copy_config($config_from,$config_to){ 
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
	function copy_database($db_from,$db_to){
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
	//
	function my_tixianlist(){
		$user_id=2;
		$where = "user_id='$user_id'";
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$res=$this->membertixian_db->listinfo($where,'log_time DESC', $page, 15);
		var_dump($res);
	}
	function apply_tixian(){
		$user_id=2;
		$data[user_id]=$user_id;
		$data[amount]=intval($_GET[amount]);
		$data[log_time]=time();
		$data[is_deal]=0;
		$this->membertixian_db->insert($data,true);die();
	}
	function decrease_member_amount($amount){
		//jianshao yonghu jine
	}
	//admin
	function tixianlist(){
		$where = "1=1";
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$res=$this->membertixian_db->listinfo($where,'log_time DESC', $page, 15);
	}
	function deal_tixian(){
		if(!isset($_GET['id'])){
			return array('error'=>'id need');
		}else{
			$id=$_GET['id'];
		}
		$deal_time=time();
		$note = isset($_GET['note']) ? $_GET['note'] : '无';
		$info['note']=$note;
		$info['is_deal']=1;
		$info['deal_time']=$deal_time;
		$this->membertixian_db->update($info, array('id'=>$id));
	}

	function user_add_bank(){
		$_GET[bank_info]='1820000132 kime';
		$user_id=2;
		$where = "`user_id`='$user_id'";
		$res=$this->memberbank_db->get_one($where);
		if(!empty($res)){
			return array('error'=>'user bank exsite');
		}
		$data[user_id]=$user_id;
		$data[bank]=1;
		$data[bank_info]=$_GET[bank_info];
		$this->memberbank_db->insert($data,true);
		return array('sucess'=>'ok');
	}
	function user_edit_bank(){
		$_GET[bank_info]='1820000132 kime2';
		$user_id=2;
		$data[bank]=2;
		$data[bank_info]=$_GET[bank_info];
		$this->memberbank_db->update($data, array('user_id'=>$user_id));
		return array('sucess'=>'ok');
	}
	
}