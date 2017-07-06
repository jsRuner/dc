<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>淮北申能_新闻资讯</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<?php  function _sp_helloworld(){ echo "hello ThinkCMF!"; } function _sp_helloworld2(){ echo "hello ThinkCMF2!"; } function _sp_helloworld3(){ echo "hello ThinkCMF3!"; } ?>
	<?php $portal_index_lastnews="1,2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
	<meta name="author" content="ThinkCMF">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">


	<link href="/themes/simplebootx/Public/assets/css/style.css" rel="stylesheet">

	<!-- CuFon ends -->
</head>
<body>
<div class="main">
	<div class="header2">
		<?php echo hook('body_start');?>

<div style="background:#fefefe">
	<div style="width:970px; text-align:center; margin:0px auto; ">
		<div class="logo">
			<h1><a href="/"><img src="/themes/simplebootx/Public/assets/images/logo2.jpg" /></a></h1>
		</div>


		<div class="menu_nav">

			<?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="li-class" ; $style="nav"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>

		</div>
		<div class="clr"></div>
	</div>
</div>
		<div style="background:url(/themes/simplebootx/Public/assets/images/header2_img.jpg); height:240px">


			<div class="clr"></div>
		</div>
		<div class="clr"></div>
	</div>
	<div class=" content_a">
		<div class="mainbar" style="background:#FFF; padding:10px; width:970px; border:1px solid #ddd">
			<?php $breadcrumb = sp_get_breadcrumb($term_id); ?>
			<div class="mainbar_con" ><h2><span >
				<?php if(is_array($breadcrumb)): foreach($breadcrumb as $key=>$vo): ?><a href="#"><?php echo ($vo["name"]); ?></a><?php endforeach; endif; ?>

				   / <a href="#"><?php echo ($post_title); ?></a> / 详情</span></h2>
			</div>
			<div class="article">
				<h2><span><?php echo ($post_title); ?></span></h2>
				<div class="clr"></div>
				<p class="post-data"><span class="date">信息来源：<?php echo ($post_source); ?></span> &nbsp;|&nbsp; 发布时间：<?php echo ($post_date); ?> &nbsp;|&nbsp; 浏览量：<?php echo ($post_hits); ?> </p>
				<!--<img src="images/images_1.jpg" width="565" height="370" alt="image" />-->
				<div id="article_content">
					<?php echo ($post_content); ?>
				</div>
				<div class="clr"></div>
			</div>

		</div>

		<div class="clr"></div>
	</div>

	
<div class="footer">
	<div class="footer_resize">
		<p class="lf">Copyright © 2013 <a href="#">申能（集团）有限公司</a>版权所有  网站备案号：沪ICP备0501160号 </p>
		<p class="rf">沪公网安备 31011202003439号联系电话：021-33570999  </p>
		<div class="clr"></div>
	</div>
</div>
<?php echo ($site_tongji); ?>

</div>
</body>
</html>