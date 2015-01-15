package net.shopxx.util.app.alipay.config;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：3.3
 *日期：2012-08-10
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 *提示：如何获取安全校验码和合作身份者ID
 *1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
 *2.点击“商家服务”(https://b.alipay.com/order/myOrder.htm)
 *3.点击“查询合作者身份(PID)”、“查询安全校验码(Key)”

 *安全校验码查看时，输入支付密码后，页面呈灰色的现象，怎么办？
 *解决方法：
 *1、检查浏览器配置，不让浏览器做弹框屏蔽设置
 *2、更换浏览器或电脑，重新登录查询。
 */

public class AlipayConfig {

	// ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	// 合作身份者ID，以2088开头由16位纯数字组成的字符串
	// 合作身份者id，以2088开头的16位纯数字
	public static String partner = "2088901886911410";

	// 收款支付宝账号
	public static String seller = "gzxuji2000@sina.com";

	// 商户私钥，自助生成
	public static String key = "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAN63BVcWufohRz14B+qTg9HokVmnaAqd9C6eF947y7QkZr/Tw9API9eID+w4FQh3qBdWM1ftjGBEjhq11Ox3oSVXdIrl6+G2h0scc33Z3D9RCZfaDcdE4e6mo+iw84pIsh7NdqZIL1EgvES9FKXzcNFYxshKu7Yw3o3WebJ4oUu9AgMBAAECgYBkCFiBsVd/HYtd9Je5qOBAW/FND4APpLqUZbXav4jTNLZh2r/Mp8A1gouEUfxAfV4mfTU6fRvb8W7SWHF2dJUP1gIy5a8JGQzkYkObafQ26ifjYbNPPzn/bCvfhEg0uWp31WTj9HoaUuF4Kc8DJOWy7oVLG0woI8gpCDQ/RKJakQJBAPdikq0os+GkhRDxzk29s/zt1ZEB7ZjfstJ3YQZQ1lAoBHAtcp7enct7ZJ4ieunt8TLf0jVX43LvzeeVO4B/QJcCQQDmeIPKHzO+o7ETVXTY97+ymetSEU28NXPRSu/Rh7vsTSULmVcQIPKsFZu8OgfMYe73LkvCdpz++3mOI0KtHgzLAkAW6pu5zLZ1JZ9qBWxeCT++I24QQ8R1z+sp0gM76Ysg28QlfCBNFUQ60FBu0bTfLLqWQuOfK2gXgp1pYYqkiaU7AkEAtiCalQmfTJHzB0JK+oKePLeh3NLLyWW8RrKfXceT3CMCmW3t/VLsMs1IqrB5JSxnOXKeb+hoHKAB6S84K7JJjQJBAKBBJII/TuKiaNxn9vM/HtnXQMhXfEfCvu5y+J2WJ7JxaigDaX3r1kK5yAduiIwGfCZF023M1L592qduKO2ccDo=";
	// 页面编码
	public static String CharSet = "UTF-8";

	// ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	// 调试用，创建TXT日志文件夹路径
	public static String log_path = "D:\\";

	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "utf-8";

	// 签名方式 不需修改
	public static String sign_type = "RSA";

}