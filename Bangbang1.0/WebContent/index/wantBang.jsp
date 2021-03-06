<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/userinfo.css"/>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/logReg.js" type="text/javascript"></script>
<title>提问</title>
<style type="text/css">
	*{ margin:0; padding:0;}
	body{ font:14px/1.5 "PingFang SC", Helvetica, "Helvetica Neue", "微软雅黑", Tahoma, Arial, sans-serif;}
	a{ text-decoration:none;}
	.header{ width:100%; height:60px; background-color:#000;}
	.mid-box{ width:1000px; height:60px; margin:0 auto;}
	.logo{ float:left; background:url(images/head_bg.png) no-repeat center; width:134px; height:60px;}
	.index{ float:left; height:60px; width:60px; text-align:center; line-height:60px; margin-left:20px; transition:background-color 0.5s;}
	.index:hover{ background-color:#333;}
	.index a{ color:#fff; font-size:14px;}
	.bangIndex{ float:left; text-align:center; height:60px; width:80px; line-height:60px; transition:background-color 0.5s; }
	.bangIndex a{ color:#fff;  font-size:14px;}
	.bangIndex:hover{ background-color:#333;}
	.search{ float:right; width:330px; height:32px; margin-top:14px; margin-right:55px;}
	.form .txt{ float:right; width:260px; height:32px;}
	.txt input{ width:260px; height:32px; padding:0 5px; border:0 none;}
	.form .btn{ float:right;width:70px; height:32px;}
	.btn input{ width:70px; height:32px; border:0; color:#FFC680; font-size:14px; font-family:"微软雅黑"; background-color:#FF8C00; cursor:pointer;}
	.login,.register{ float:right;  height:60px; width:60px; line-height:60px; text-align:center; margin-right:20px; transition:background-color 0.5s;}
	.login:hover{ background-color:#f00;}
	.register:hover{ background-color:#333;}
	.customer a{ text-decoration:none; color:#666; font-family:"微软雅黑";}
	
	.wraper{ width:100%; margin-top:10px;}
	.showArea{ width:1000px; margin:0 auto; overflow:hidden;}
	.leftwraper{ float:left; width:600px;}
	.ques-head{ height:42px; line-height:42px; margin-left:30px;}
	.ques-head h3{ font-size:18px; font-weight:400;}
	.biaoti{ margin-left:30px;}
	.leftwraper .title{ height:80px;}
	.title .label{ float:left; width:30px; text-align:center; line-height:40px; color:#ff9600;}
	.title .title-area{ float:left; height:40px; width:570px;}
	.title-area input{ height:40px; width:563px; padding-left:5px; outline:none;}
	.tipsMes{ display:none; margin-left:30px; margin-top:5px; height:24px; line-height:24px; font-size:12px; color:#f01400; margin-bottom:5px;}
	.ques-main{ width:570px; height:340px; border:1px solid #ccc; margin-left:30px;}
	.ques-main .quesTop{ height:40px; background-color:#EDF1F7;}
	.ques-main .ques-content{ height:300px;}
	.ques-content textarea{ height:280px; width:548px; border:none; font-size:20px; line-height:20px; word-break:break-all; word-wrap:break-word; padding:10px; outline:none;}
	.send{ width:160px; height:40px; margin-left:40px; margin-top:20px; text-align:center; line-height:40px; cursor:pointer;}
	.send input{ width:160px; height:40px; border:none; font:14px/1.5 "PingFang SC", Helvetica, "Helvetica Neue", "微软雅黑", Tahoma, Arial, sans-serif; background-color:#f01400; color:#fff; outline:none; cursor:pointer;}
	
	.rightwraper{ float:left; width:380px; margin-left:20px; overflow:hidden;}
	.rightwraper .hot-head{ background-color:#fff; margin-top:20px; margin-bottom:10px; overflow:hidden;}
	.hot-head .left-head{ float:left; background-color:#fff; height:30px; line-height:30px;}
	.hot-head .left-head span{ margin-left:10px; color:#07111b; font-size:16px;}
	
	.attention dl{ display:block;}
	.attention dt{ display:block; font-size:14px; font-weight:bold; magin:0.2em 0;}
	.attention dd{ display:block; margin:12px 0; color:#787d82;}
	.footer{ width:100%; margin-top:30px; height:200px; background-color:#000;}
	.footer-content{ width:1000px; margin:0 auto;}
	.foot-title{ width:720px; height:40px; font-size:12px; text-align:center; padding-top:40px; margin:0px auto;}
	.foot-title ul{ display:block; width:350px; margin:0 auto; height:20px; list-style:none; text-align:center;}
	.foot-title ul li{ float:left; color:#fff; }
	.foot-title p{ clear:both; color:#666;}
	.foot-value{ width:600px; height:50px; margin:40px auto;}
	.foot-value ul{ list-style:none;}
	.foot-value li{ display:block; float:left; margin-right:20px;}
	.clear{ clear:both;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
        var title = $('#title');
		var content = $('#bangCon');
		var tips = $('#tips');
		var send = $('#send');
		title.bind("click",function(){
			if(title.val() == ""){
				tips.css("display","block");
			}else{
				tips.css("display","none");
			}
			
		});
		content.bind("click",function(){
			if(title.val() == ""){
				tips.css("display","block");
			}else{
				tips.css("display","none");
			}
			
		});
		send.bind("click",function(){
			if((title.val() =="") && (content.val() =="")){
				alert("标题或内容为空！");	
			}
		});
    });
</script>
</head>

<body>
<div class="header">
    <div class="mid-box">
        <div class="logo"></div>
        <div class="index">
        	<a href="showIndex.action">首页</a>
        </div>
        <div class="bangIndex"><a href="showFound.action">帮帮招领</a></div>
        <div class="after-customer">
            <a href="#" class="newMes">消息</a>
            <a id="personal" href="#"><img src="user/<s:property value='#session.username' />/images/cus.jpg" class="cusImg" /></a>
        	<div class="personal" id="personalInfo">
                <div class="triangle"><img src="images/triangle.png" /></div>
                <div class="per-head">
                    <div class="per-img"><img src="user/<s:property value='#session.username' />/images/cus.jpg" /></div>
                    <div class="per-info">
                        <h3><s:property value='#session.username' /></h3>
                        <p><s:property value="#session.bang" />帮帮</p>
                    </div>
                    <div class="clear"></div>
                </div> 
                <div class="per-bottom">
                    <a href="showEditUserInfo.action" class="setinfo">个人设置</a><a href="exit.action" class="exit">退出</a>
                </div>
            </div>
        </div>
        <div class="search">
            <form action="#" method="get" class="form">
                <div class="btn"><input type="submit" value="搜 索" /></div>
                <div class="txt"><input type="text" /></div>
            </form>
        </div>
    </div>
</div>
<div class="wraper">
	<div class="showArea">
    	<div class="leftwraper">
        	<div class="ques-head">
                <h3>提问</h3>
            </div>
            <div class="biaoti">标题</div>
            <form action="askBang.action" method="post">
	            <div class="title">
	            	<span class="label">*</span>
	                <div class="title-area">
	            		<input type="text" name="title" id="title"/>
	                </div>
	                <div class="clear"></div>
	                <p class="tipsMes" id="tips">标题不能为空!</p>
	            </div>
	            
	            <div class="ques-main">
	            	<div class="quesTop"></div>
	                <div class="ques-content"><textarea name="content" id="bangCon"></textarea></div>
	            </div>
	            <div class="send">
					<input type="submit" id="send" value="发布" />             
	            </div>
            </form>    
        </div>
        <div class="rightwraper">
        	<div class="hot-head">
                <div class="left-head">
                    <span>注意事项</span>
                </div>
            </div>
            <div class="attention">
            	<dl>
                	<dt>问答禁止这些提问</dt>
                    <dd>1、禁止发布求职、交易、推广、广告类与问答无关信息将一律清理。</dd>
                    <dd>2、尽可能详细描述您的问题，如标题与内容不符，或与问答无关的信息将被删除扣分。</dd>
                    <dd>3、问答刷屏用户一律冻结帐号</dd>
                </dl>
            </div>
        </div>
        
    </div>
         	
</div>
<div class="footer">
    <div class="footer-content">
        <div class="foot-title">
            <ul>
                <li>帮帮简介| </li>
                <li>帮帮公告| </li>
                <li>招贤纳士| </li>
                <li>联系我们| </li>
                <li>客服热线：400-675-1234</li>
            </ul>
            <p>Copyright @ 2006-2014 木刻版区所有 京ICP备09037834号 京ICP证B1034-8373号 某市公安局XX分局备案编号：123456789123</p>
        </div>
        <div class="foot-value">
            <ul>
                <li><img src="images/credit.jpg" /></li>
                <li><img src="images/credit.jpg" /></li>
                <li><img src="images/credit.jpg" /></li>
                <li><img src="images/credit.jpg" /></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>