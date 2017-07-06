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
		<div style="background:url(/themes/simplebootx/Public/assets/images/header6_img.jpg); height:240px">


			<div class="clr"></div>
		</div>
		<div class="clr"></div>
	</div>
	<div class="content">
		<div class="mainbar" style="background:#FFF; padding:10px; width:630px">
			<div  class="mainbar_con" ><h2><span ><?php echo ($name); ?></span></h2></div>


			<?php $lists = sp_sql_posts_paged_bycatid($cat_id,"",20); ?>
			<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>


				<div class="article">
					<h2><a href="#">申能奉贤热电工程主厂房浇筑第一罐混凝土</a></h2>
					<div class="clr"></div>
					<p class="post-data"><span class="date">信息来源：总公司</span> &nbsp;|&nbsp; 发布时间：2017年4月5日 &nbsp;|&nbsp; 浏览量：28 </p>
					<p>  4月27日上午10时18分，随着搅拌罐隆隆翻滚，泵机长臂舒展，申能奉贤热电工程主厂房顺利浇筑了第一罐混凝土。股东方代表、公司全体员工以及设计单位、监理单位、施工单位等相关工作人员共同见证了这一重要时刻，第一罐混凝土的浇筑标志着申能奉贤热电工程正式开工。
						<a href="#" title="详细">了解详细</a></p>
					<div class="clr"></div>
				</div>
				<hr /><?php endforeach; endif; else: echo "" ;endif; ?>











				<div class="pagenavi"><span class="pages">36条资讯 共5页</span><span class="current">1</span><a href="#" title="2">2</a><a href="#" title="2">3</a><a href="#" title="2">4</a><a href="#" title="2">5</a><a href="#" >&raquo;</a></div>
		</div>
		<div class="sidebar">


			<div class="gadget" style="border:1px solid #CCC; background:#fff; padding:0">
				<h2 class="star" style="padding-left:10px"><span>新闻资讯</span> </h2>
				<div class="clr"></div>
				<ul class="sb_menu_x" style=" margin:0px " >

					<?php $term_id=8; $terms=sp_get_child_terms($term_id ); ?>
					<?php if(is_array($terms)): foreach($terms as $key=>$vo): ?><!--打印出分类名称 -->
						<li>
							<a href="<?php echo leuu('list/index',array('id'=>$vo['term_id']));?>"><?php echo ($vo["name"]); ?></a>
						</li><?php endforeach; endif; ?>

				</ul>
			</div>

			<div class="gadget">
				<div class="tit_310"><span>本月热门</span></div>
				<div class="clr"></div>
				<ul class="sb_menu2">
					<li class="active"><a href="#">2017年迎峰度夏反事故应急演练成功...
					</a> <span>17-07-05</span> </li>
					<li><a href="#">安全飞检"三把锁""安全生产万里行"...
					</a><span>17-07-05</span></li>
					<li><a href="#">公司党组理论学习中心组进行"一带一...
					</a><span>17-07-05</span></li>
					<li><a href="#">国家电网光伏扶贫值得称道
					</a><span>17-07-05</span></li>
					<li><a href="#">规矩多了，安全才有保障
					</a><span>17-07-05</span></li>
					<li><a href="#" title="Website Templates">新一轮农网改造升级工程系列</a><span>17-07-05</span></li>
					<li class="active"><a href="#">2017年迎峰度夏反事故应急演练成功...
					</a> <span>17-07-05</span> </li>
					<li><a href="#">安全飞检"三把锁""安全生产万里行"...
					</a><span>17-07-05</span></li>
					<li><a href="#">公司党组理论学习中心组进行"一带一...
					</a><span>17-07-05</span></li>
					<li><a href="#">国家电网光伏扶贫值得称道
					</a><span>17-07-05</span></li>
					<li><a href="#">规矩多了，安全才有保障
					</a><span>17-07-05</span></li>
					<li><a href="#" title="Website Templates">新一轮农网改造升级工程系列</a><span>17-07-05</span></li>
				</ul>
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