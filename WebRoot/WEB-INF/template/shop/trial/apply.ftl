<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/wjl_details.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.jqzoom.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.lSelect.js"></script>
<link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/sy_apply.css"/>
<link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/heard.css"/>
<link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/bottom.css"/>
<title>试用申请</title>
<style type="text/css"> 
		dd.panel,.flip
		{
		margin:0px;
		padding:5px;
		}
		dd.panel
		{
		display:none;
		width:600px;
		margin:0px 10px;
		}
		.agreement {
			height: 96px;
			line-height: 24px;
			padding: 0px 4px;
			color: #999999;
			overflow-y: scroll;
			border: 1px solid #e6e6e6;
		}
	</style>
<script type="text/javascript">
	$().ready(function() {
		var $areaId = $("#areaId");
		var $user_policy = $("#user_policy");
		var $trialApplyForm = $("#trialApplyForm");
		var $submit = $(":submit");
		var $zoom = $("#zoom");
		var $scrollable = $("#scrollable");
		var $thumbnail = $("#scrollable a");
		// 地区选择
		$areaId.lSelect({
			url: "${base}/common/area.jhtml"
		});
		
		$(".flip").click(function(){
	    	$(".panel").slideToggle("slow");
	    });
	    
	    //下拉特定位置上面
	$("#applyNow").click(function(){
    $("html, body").scrollTop(0).animate({scrollTop: $(".jindu").offset().top});
	})
	    
	    // 商品图片放大镜
	$zoom.jqzoom({
		zoomWidth: 368,
		zoomHeight: 368,
		title: false,
		showPreload: false,
		preloadImages: false
	});
	
	// 商品缩略图滚动
	$scrollable.scrollable();
	
	$thumbnail.hover(function() {
		var $this = $(this);
		if ($this.hasClass("current")) {
			return false;
		} else {
			$thumbnail.removeClass("current");
			$this.addClass("current").click();
		}
	});
	    
		// 表单验证
		$trialApplyForm.validate({
			rules: {
				receiver: "required",
				areaId: "required",
				address: "required",
				telephone: "required",
				zipCode: "required",
				applyReason: {
					required:true,   
					maxlength:800
				}
			},
			submitHandler: function(form) {
				if($user_policy.attr('checked')=="checked"){
					$.ajax({
						url: $trialApplyForm.attr("action"),
						type: "POST",
						data: $trialApplyForm.serialize(),
						dataType: "json",
						cache: false,
						success: function(message) {
							$.message(message);
							if (message.type == "success") {
								setTimeout(function() {
									$submit.prop("disabled", false);
									window.location.href = "${base}/trialApply/succeed.jhtml";
								}, 2000);
							}else if (message.type == "warn") {
								setTimeout(function() {
									$submit.prop("disabled", false);
									window.location.href = "${base}/trial/trial_index.jhtml";
								}, 2000);
							} else {
								setTimeout(function() {
									$submit.prop("disabled", false);
									window.location.href = "${base}/login.jhtml";
								}, 2000);
							}
						}
					});
				}else{
					alert("请先查看《用户服务协议》");
				}
			}
		});	
		
	});
</script>
</head>

<body>
[#include "/shop/include/header.ftl" /]
<div class="content">
<!--商品 BEGIN-->
<div class="container productContent" id="productContent_c" style="margin-top: 10px;">
	<div class="span18 last" style="width:1190px; margin-top:0px; height:530px; margin-bottom:20px;">
			<div class="productImage">
				[#if product.productImages?has_content]
					<a id="zoom" href="${product.productImages[0].large}" rel="gallery">
						<img class="medium" src="${product.productImages[0].medium}" />
					</a>
				[#else]
					<a id="zoom" href="${setting.defaultLargeProductImage}" rel="gallery">
						<img class="medium" src="${setting.defaultMediumProductImage}" />
					</a>
				[/#if]
				<a href="javascript:;" class="prev"></a>
				<div id="scrollable" class="scrollable">
					<div class="items">
						[#if product.productImages?has_content]
							[#list product.productImages as productImage]
								<a[#if productImage_index == 0] class="current"[/#if] href="javascript:;" rel="{gallery: 'gallery', smallimage: '${productImage.medium}', largeimage: '${productImage.large}'}"><img src="${productImage.thumbnail}" title="${productImage.title}" /></a>
							[/#list]
						[#else]
							<a class="current" href="javascript:;"><img src="${setting.defaultThumbnailProductImage}" /></a>
						[/#if]
					</div>
				</div>
				<a href="javascript:;" class="next"></a>
			</div>
			
		<!--商品名称，价格，型号，那一坨-->
			
		<div id="shop_infor">
			<div class="name">${product.name}[#if product.isGift] [${message("shop.product.gifts")}][/#if]</div>
		 
		 
		 <!--价格信息-->
		     <div id="about_goods">
	             <DL>
		                 <dt>市场价格：${currency(product.marketPrice, true)}</dt>
		                 <dd>月初计售出：${product.monthSales}件</dd>
		                 <dt>商城价：<i>￥${product.price}</i></dt>
		                 <dd>库存：${product.stock}</dd>
						 [#if product.scoreCount > 0]
							<dt>
								<div id="xq_star">
									<div>${message("Product.score")}:</div>
									<div class="score${(product.score * 2)?string("0")}"></div>
									<div>${product.score?string("0.0")} </div>
								<div>
							</dt>
				            <dd><i>${product.scoreCount}</i>人已评去评论</dd>
						[/#if]
	              </DL>
             </div>
			
			<!--颜色选择-->
			 <div id="choose">
		            <div id="sell">
						    [#if product.validPromotions?has_content]
							<dl>
								<dt>${message("Product.promotions")}:</dt>
								<dd>
									[#list product.validPromotions as promotion]
										<a href="javascript:;" target="_blank" title="${promotion.title}[#if promotion.beginDate?? || promotion.endDate??] (${promotion.beginDate} ~ ${promotion.endDate})[/#if]">${promotion.name}</a>
									[/#list]
								</dd>
							</dl>
						    [/#if]
					</div>
            </div>
						<div class="action">
							<input type="button" value="立即申请" id="applyNow">
						</div>
			</div>
			
				<!--服务，分享-->	
				<div id="shop_infor_bottom">
				  <div id="assurance"><img src="/resources/shop/images/zpbz_ico.png">正品保证<img src="/resources/shop/images/jgbg_ico.png">七天调价补差额</div>
				  <div id="collect"> </div>
				</div>
		</div>
<!--商品 END-->
<div class="jindu">
  <ul>
     <li>新品免费试用流程</li>
     <li><img src="${base}/resources/shop/images/sy_bg_tx.png"/>提交试用申请</li>
     <li><img src="${base}/resources/shop/images/jiantou_ico.png" /></li>
     <li><img src="${base}/resources/shop/images/sy_bg_dd.png" />等待审核</li>
     <li><img src="${base}/resources/shop/images/jiantou_ico.png" /></li>
     <li><img src="${base}/resources/shop/images/sy_bg_ps.png"/>获得试用商品</li>
     <li><img src="${base}/resources/shop/images/jiantou_ico.png" /></li>
     <li><img src="${base}/resources/shop/images/sy_bg_tj.png" />提交试用报告</li>
     </ul>
  </div>
<div class="tianxie">
	<form id="trialApplyForm" action="${base}/trialApply/save.jhtml" method="post">
	<input id="trial" name="trialId" value="${trial.id}" type="hidden"/>
   <div class="about">
      用户：<i>${member.username}</i>  申请参加：[#if trial.products?has_content]
	[#list trial.products as product]
	${product.name}
	<input id="product" name="productId" value="${product.id}" type="hidden"/>
	[/#list]
	[/#if]  用户试用活动
      </div>
   <div class="queren">
   <dl>
      <dt>确认收获信息</dt>
      <dd>
	      <span><i>*</i>所有地区</span>
	      <span style="width: auto;"><input type="hidden" id="areaId" name="areaId" /></span>
       </dd>
       <dd><span><i>*</i>邮政编码</span><input class="t1" type="text" name="zipCode"/></dd>  
       <dd><span><i>*</i>街道地址</span><input class="t1" type="text" name="address"/></dd>  
       <dd><span><i>*</i>收货人姓名</span><input class="t1" type="text" name="receiver"/></dd>  
       <dd><span><i>*</i>手机号码</span><input class="t1" type="text" name="telephone"/></dd>
       <dd><span>电话号码</span><input class="t2" type="text" name="areaCode"/>－<input class="t3" type="text" name="phoneNum" />－<input class="t2" type="text" name="extension" /></dd>     
      </dl>
  </div>
  <div class="liyou">
  <dl>
      <dt>申请理由</dt>
      <dd><textarea class="t4" name="applyReason"></textarea></dd>
       <dd>你还可以输入<i>800</i>字</dd>
       <dd><input type="checkbox" id="user_policy" />&nbsp;&nbsp;我已经仔细阅读《<span class="flip">用户试用协议</span>》并同意所有条款</dd>
       <dd class="panel">
	       <div id="agreement" class="agreement" style="height: 200px;">
	       <p>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。如用户通过本网站注册程序，即表示用户与本网站已达成协议，自愿接受本服务条款的所有内容。此后，用户不得以未阅读本服务条款内容作任何形式的抗辩。</p> <p>一、本站服务条款的确认和接纳<br>本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。本服务条款的效力范围及于本网站的一切产品和服务，用户在享受本网站的任何服务时，应当受本服务条款的约束。</p> <p>二、服务简介<br>本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须:  1. 提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。</p> <p>三、用户在不得在本网站上发布下列违法信息<br>1. 反对宪法所确定的基本原则的； 2. 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3. 损害国家荣誉和利益的； 4. 煽动民族仇恨、民族歧视，破坏民族团结的； 5. 破坏国家宗教政策，宣扬邪教和封建迷信的； 6. 散布谣言，扰乱社会秩序，破坏社会稳定的； 7. 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8. 侮辱或者诽谤他人，侵害他人合法权益的； 9. 含有法律、行政法规禁止的其他内容的。</p> <p>四、有关个人资料<br>用户同意:  1. 提供及时、详尽及准确的个人资料。 2. 同意接收来自本网站的信息。 3. 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。 4. 本网站不公开用户的姓名、地址、电子邮箱和笔名。除以下情况外:  a) 用户授权本站透露这些信息。 b) 相应的法律及程序要求本站提供用户的个人资料。</p> <p>五、服务条款的修改<br>本网站有权在必要时修改服务条款，一旦条款及服务内容产生变动，本网站将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息服务，则视为接受服务条款的变动。</p> <p>六、用户隐私制度<br>尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的:  1. 遵守有关法律规定，遵从本网站合法服务程序。 2. 保持维护本网站的商标所有权。 3. 在紧急情况下竭力维护用户个人和社会大众的隐私安全。 4. 符合其他相关的要求。</p> <p>七、用户的帐号、密码和安全性<br>用户一旦注册成功，将获得一个密码和用户名。用户需谨慎合理的保存、使用用户名和密码。如果你不保管好自己的帐号和密码安全，将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。你可随时根据指示改变你的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告本网站。   八、 拒绝提供担保 用户明确同意信息服务的使用由用户个人承担风险。本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p> <p>九、有限责任<br>如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失，同时会尽量避免这种损害的发生。</p> <p>十、用户信息的储存和限制<br>本站有判定用户的行为是否符合国家法律法规规定及本站服务条款权利，如果用户违背本网站服务条款的规定，本网站有权中断对其提供服务的权利。</p> <p>十一、用户管理<br>用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本站的国家法律、地方法律和国际法律标准的。用户必须遵循:  1. 使用网络服务不作非法用途。 2. 不干扰或混乱网络服务。 3. 遵守所有使用网络服务的网络协议、规定、程序和惯例。 用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输何教唆他人构成犯罪行为的资料；不能传输助长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。 若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。</p> <p>十二、通告<br>所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p> <p>十三、信息内容的所有权<br>本网站定义的信息内容包括: 文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。</p> <p>十四、法律<br>本协议的订立、执行和解释及争议的解决均应适用中华人民共和国的法律。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。</p>
	       </div>
       </dd>
       <dd><input class="bg_tj_but" value="提交申请" type="submit" /></dd>
      </dl>
      </div>
      </form>
   </div>



   <!--左边试用宣言，试用报告-->
 <div class="le">
  <div class="declaration">
    <dl>
    <dt>试用宣言</dt>
      [#list trials as trial] 
         		[#if trial.trialApplys?has_content]
		         	[#list trial.trialApplys as trialApply]
		         	[#if trialApply_index<4]
		         	<dd>
		           <div class="d_name">
			     ${trialApply.receiver?substring(0,1)} * *
			      ${trialApply.createDate}
			     </div>
			     [#if trialApply.applyReason?length>20]
				<div class="d_infor">${trialApply.applyReason?substring(0,20)}....</div>
			     [#else]
				<div class="d_infor">${trialApply.applyReason}</div>
			     [/#if]
			     </dd>
		            [/#if]
	            	[/#list]
            	[/#if]
             [/#list]
    </dl>
    </div>
    <!--试用申请，end-->
    
    
    <!--试用报告-->
   <div class="report">
    <dl>
    <dt>试用报告</dt>
    <dd class="t1">${product.name}</dd>
     [#list reports as report]
      <dd>
      <div class="d_name">${report.trialApply.receiver?substring(0,1)}* * 
      [#if TrialReport.area.parent.parent??]
      ${report.area.parent.parent?substring(0,2)} 
      [#else]${report.area.parent?substring(0,2)} 
      [/#if] 
       ${report.createDate}</div>
      <div class="d_infor">作为万家乐老用户，总希望能尝试万家乐的新产品。外观看来这款热水器非常高档，马上半斤新家，希望可以用上这高大上的产品。</div>
      <div class="r_more"><A href="#">查看详情》》</A></div>
      <div class="r_pic">
         <img src="/resources/shop/images/bg_pc1.jpg" />
         <img src="/resources/shop/images/bg_pc2.jpg" />
          </div>
      </dd>
      [/#list]
    </dl>
    </div> 
   </div>
   <!--试用报告，end-->
   
   <!--产品特点-->
  <div class="about_goods">
   <div class="tittle">产品特点</div>
	${product.introduction}
    </div>
     
</div>
[#include "/shop/include/footer.ftl" /]
</body>
</html>
