<?php

/**

 *  base.php PHPCMS框架入口文件

 *

 * @copyright			(C) 2005-2010 PHPCMS

 * @license				http://www.phpcms.cn/license/

 * @lastmodify			2010-6-7

 */

define('IN_PHPCMS', true);

define('MASETER_SITE', 'www.test2.com');

//PHPCMS框架路径

define('PC_PATH', dirname(__FILE__).DIRECTORY_SEPARATOR);



if(!defined('PHPCMS_PATH')) define('PHPCMS_PATH', PC_PATH.'..'.DIRECTORY_SEPARATOR);



//缓存文件夹地址
$host_url=$_SERVER['HTTP_HOST'];

$host_url = str_ireplace('www.', '', $host_url);

$host_url = strtolower($host_url);

$host_url = str_replace('-', '_', $host_url);

$host_url = str_replace('.', '_', $host_url);

define('CACHE_PATH', PHPCMS_PATH.'caches/'.$host_url.DIRECTORY_SEPARATOR);
$master_url=MASETER_SITE;

$master_url = str_ireplace('www.', '', $master_url);

$master_url = strtolower($master_url);

$master_url = str_replace('-', '_', $master_url);

$master_url = str_replace('.', '_', $master_url);

define('MASETR_CACHE_PATH', PHPCMS_PATH.'caches/'.$master_url.DIRECTORY_SEPARATOR);



//主机协议

define('SITE_PROTOCOL', isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://');

//当前访问的主机名

define('SITE_URL', (isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : ''));

//来源

define('HTTP_REFERER', isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '');

define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches/'.$host_url.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);

		

//系统开始时间

define('SYS_START_TIME', microtime());



//加载公用函数库

pc_base::load_sys_func('global');

pc_base::load_sys_func('extention');

pc_base::auto_load_func();



pc_base::load_config('system','errorlog') ? set_error_handler('my_error_handler') : error_reporting(E_ERROR | E_WARNING | E_PARSE);

//设置本地时差

function_exists('date_default_timezone_set') && date_default_timezone_set(pc_base::load_config('system','timezone'));



define('CHARSET' ,pc_base::load_config('system','charset'));

//输出页面字符集

header('Content-type: text/html; charset='.CHARSET);



define('SYS_TIME', time());

//定义网站根路径

define('WEB_PATH',pc_base::load_config('system','web_path'));

//js 路径

define('JS_PATH',pc_base::load_config('system','js_path'));

//css 路径

define('CSS_PATH',pc_base::load_config('system','css_path'));

//img 路径

define('IMG_PATH',pc_base::load_config('system','img_path'));


//动态程序路径

define('APP_PATH','http://'.$_SERVER['HTTP_HOST'].'/');

//前段模板的静态资源路径
$sitelist = getcache('sitelist','commons');
$stlye=$sitelist[1]['default_style'];
$tpl_static_path='http://'.SITE_URL.'/statics/'.$stlye.'_files/';
define('TPL_STATIC_PATH',$tpl_static_path);

//网站名称
$site_name=$sitelist[1]['site_title'];
define('SITE_NAME',$site_name);

//上传文件路径,如果设置了cdn 就用cdn ，否则就用本地网站的目录
$cdn_url=null;
if(isset($cdn_url)){
	$upload_url=$cdn_url;
}else{
	$upload_url=$_SERVER['HTTP_HOST'];
}
//加上10000给人感觉网站很多的样子
$site_id=pc_base::load_config('system','site_id')+10000;
$upload_url='http://'.$upload_url.DIRECTORY_SEPARATOR.'uploadfile'.DIRECTORY_SEPARATOR.'site_'.$site_id.DIRECTORY_SEPARATOR;
define('UPLOAD_PATH',$upload_url);
//应用静态文件路径

define('PLUGIN_STATICS_PATH',WEB_PATH.'statics/plugin/');

if(pc_base::load_config('system','gzip') && function_exists('ob_gzhandler')) {

	ob_start('ob_gzhandler');

} else {

	ob_start();

}



class pc_base {

	

	/**

	 * 初始化应用程序

	 */

	public static function creat_app() {

		return self::load_sys_class('application');

	}

	/**

	 * 加载系统类方法

	 * @param string $classname 类名

	 * @param string $path 扩展地址

	 * @param intger $initialize 是否初始化

	 */

	public static function load_sys_class($classname, $path = '', $initialize = 1) {

			return self::_load_class($classname, $path, $initialize);

	}

	

	/**

	 * 加载应用类方法

	 * @param string $classname 类名

	 * @param string $m 模块

	 * @param intger $initialize 是否初始化

	 */

	public static function load_app_class($classname, $m = '', $initialize = 1) {

		$m = empty($m) && defined('ROUTE_M') ? ROUTE_M : $m;

		if (empty($m)) return false;

		return self::_load_class($classname, 'modules'.DIRECTORY_SEPARATOR.$m.DIRECTORY_SEPARATOR.'classes', $initialize);

	}

	

	/**

	 * 加载数据模型

	 * @param string $classname 类名

	 */

	public static function load_model($classname) {

		return self::_load_class($classname,'model');

	}

		

	/**

	 * 加载类文件函数

	 * @param string $classname 类名

	 * @param string $path 扩展地址

	 * @param intger $initialize 是否初始化

	 */

	private static function _load_class($classname, $path = '', $initialize = 1) {

		static $classes = array();

		if (empty($path)) $path = 'libs'.DIRECTORY_SEPARATOR.'classes';



		$key = md5($path.$classname);

		if (isset($classes[$key])) {

			if (!empty($classes[$key])) {

				return $classes[$key];

			} else {

				return true;

			}

		}

		if (file_exists(PC_PATH.$path.DIRECTORY_SEPARATOR.$classname.'.class.php')) {

			include PC_PATH.$path.DIRECTORY_SEPARATOR.$classname.'.class.php';

			$name = $classname;

			if ($my_path = self::my_path(PC_PATH.$path.DIRECTORY_SEPARATOR.$classname.'.class.php')) {

				include $my_path;

				$name = 'MY_'.$classname;

			}

			if ($initialize) {

				$classes[$key] = new $name;

			} else {

				$classes[$key] = true;

			}

			return $classes[$key];

		} else {

			return false;

		}

	}

	

	/**

	 * 加载系统的函数库

	 * @param string $func 函数库名

	 */

	public static function load_sys_func($func) {

		return self::_load_func($func);

	}

	

	/**

	 * 自动加载autoload目录下函数库

	 * @param string $func 函数库名

	 */

	public static function auto_load_func($path='') {

		return self::_auto_load_func($path);

	}

	

	/**

	 * 加载应用函数库

	 * @param string $func 函数库名

	 * @param string $m 模型名

	 */

	public static function load_app_func($func, $m = '') {

		$m = empty($m) && defined('ROUTE_M') ? ROUTE_M : $m;

		if (empty($m)) return false;

		return self::_load_func($func, 'modules'.DIRECTORY_SEPARATOR.$m.DIRECTORY_SEPARATOR.'functions');

	}

	

	/**

	 * 加载插件类库

	 */

	public static function load_plugin_class($classname, $identification = '' ,$initialize = 1) {

		$identification = empty($identification) && defined('PLUGIN_ID') ? PLUGIN_ID : $identification;

		if (empty($identification)) return false;

		return pc_base::load_sys_class($classname, 'plugin'.DIRECTORY_SEPARATOR.$identification.DIRECTORY_SEPARATOR.'classes', $initialize);

	}

	

	/**

	 * 加载插件函数库

	 * @param string $func 函数文件名称

	 * @param string $identification 插件标识

	 */

	public static function load_plugin_func($func,$identification) {

		static $funcs = array();

		$identification = empty($identification) && defined('PLUGIN_ID') ? PLUGIN_ID : $identification;

		if (empty($identification)) return false;

		$path = 'plugin'.DIRECTORY_SEPARATOR.$identification.DIRECTORY_SEPARATOR.'functions'.DIRECTORY_SEPARATOR.$func.'.func.php';

		$key = md5($path);

		if (isset($funcs[$key])) return true;

		if (file_exists(PC_PATH.$path)) {

			include PC_PATH.$path;

		} else {

			$funcs[$key] = false;

			return false;

		}

		$funcs[$key] = true;

		return true;

	}

	

	/**

	 * 加载插件数据模型

	 * @param string $classname 类名

	 */

	public static function load_plugin_model($classname,$identification) {

		$identification = empty($identification) && defined('PLUGIN_ID') ? PLUGIN_ID : $identification;

		$path = 'plugin'.DIRECTORY_SEPARATOR.$identification.DIRECTORY_SEPARATOR.'model';

		return self::_load_class($classname,$path);

	}

	

	/**

	 * 加载函数库

	 * @param string $func 函数库名

	 * @param string $path 地址

	 */

	private static function _load_func($func, $path = '') {

		static $funcs = array();

		if (empty($path)) $path = 'libs'.DIRECTORY_SEPARATOR.'functions';

		$path .= DIRECTORY_SEPARATOR.$func.'.func.php';

		$key = md5($path);

		if (isset($funcs[$key])) return true;

		if (file_exists(PC_PATH.$path)) {

			include PC_PATH.$path;

		} else {

			$funcs[$key] = false;

			return false;

		}

		$funcs[$key] = true;

		return true;

	}

	

	/**

	 * 加载函数库

	 * @param string $func 函数库名

	 * @param string $path 地址

	 */

	private static function _auto_load_func($path = '') {

		if (empty($path)) $path = 'libs'.DIRECTORY_SEPARATOR.'functions'.DIRECTORY_SEPARATOR.'autoload';

		$path .= DIRECTORY_SEPARATOR.'*.func.php';

		$auto_funcs = glob(PC_PATH.DIRECTORY_SEPARATOR.$path);

		if(!empty($auto_funcs) && is_array($auto_funcs)) {

			foreach($auto_funcs as $func_path) {

				include $func_path;

			}

		}

	}

	/**

	 * 是否有自己的扩展文件

	 * @param string $filepath 路径

	 */

	public static function my_path($filepath) {

		$path = pathinfo($filepath);

		if (file_exists($path['dirname'].DIRECTORY_SEPARATOR.'MY_'.$path['basename'])) {

			return $path['dirname'].DIRECTORY_SEPARATOR.'MY_'.$path['basename'];

		} else {

			return false;

		}

	}

	

	/**

	 * 加载配置文件

	 * @param string $file 配置文件

	 * @param string $key  要获取的配置荐

	 * @param string $default  默认配置。当获取配置项目失败时该值发生作用。

	 * @param boolean $reload 强制重新加载。

	 */

	public static function load_config($file, $key = '', $default = '', $reload = false) {

		static $configs = array();

		if (!$reload && isset($configs[$file])) {

			if (empty($key)) {

				return $configs[$file];

			} elseif (isset($configs[$file][$key])) {

				return $configs[$file][$key];

			} else {

				return $default;

			}

		}

		$path = CACHE_PATH.'configs'.DIRECTORY_SEPARATOR.$file.'.php';

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

	/**

	 * 加载主站配置文件

	 * @param string $file 配置文件

	 * @param string $key  要获取的配置荐

	 * @param string $default  默认配置。当获取配置项目失败时该值发生作用。

	 * @param boolean $reload 强制重新加载。

	 */

	public static function master_load_config($file, $key = '', $default = '', $reload = false) {

		static $configs = array();

		if (!$reload && isset($configs[$file])) {

			if (empty($key)) {

				return $configs[$file];

			} elseif (isset($configs[$file][$key])) {

				return $configs[$file][$key];

			} else {

				return $default;

			}

		}

		$path = MASETR_CACHE_PATH.'configs'.DIRECTORY_SEPARATOR.$file.'.php';

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

}