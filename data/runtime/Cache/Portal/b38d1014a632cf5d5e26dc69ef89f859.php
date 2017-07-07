<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>淮北申能_公司制度</title>
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
		<div style="background:url(/themes/simplebootx/Public/assets/images/banner_bg.jpg)">
			<div class="hbg">

				<?php $home_slides=sp_getslide("portal_index"); ?>

				<?php if(is_array($home_slides)): foreach($home_slides as $k=>$vo): if($k ==1 ): ?><a href="<?php echo ($vo["slide_url"]); ?>">
							<img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" alt="">
						</a>

						<?php else: ?>

						<a href="<?php echo ($vo["slide_url"]); ?>" style="display: none">
							<img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" alt="">
						</a><?php endif; endforeach; endif; ?>



				<!--<img src="/themes/simplebootx/Public/assets/images/header_images.jpg" width="968"   alt="header images" class="fr" />-->
			</div>

			<div class="clr"></div>
		</div>
		<div class="clr"></div>
	</div>
	<div class="content">
		<div class="mainbar">
			<div class="article">
				<div class="tit_636"><span>新闻动态</span></div>
				<div class="clr"></div>

				<div class="sb_menu3_d">


					<?php $cat_id = 8; $lists = sp_sql_posts_paged_bycatid($cat_id,"order:recommended DESC,post_date DESC",5); ?>
					<?php if(is_array($lists['posts'])): $k = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k; $smeta=json_decode($vo['smeta'], true); ?>

						 <?php if($k ==1 ): ?><a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>">
								<img style="width: 259px; height: 225px;" src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" alt="">
							</a>


								<?php else: ?>

						<a style="display: none" href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>">
							<img style="width: 259px; height: 225px;" src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" alt="">
						</a><?php endif; endforeach; endif; else: echo "" ;endif; ?>






					<ul class="sb_menu3">

						<?php $cat_id = 8; $lists = sp_sql_posts_paged_bycatid($cat_id,"order:recommended DESC,post_date DESC",8); ?>
						<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>

							<li class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>"><?php echo ($vo['post_title']); ?>...
							</a> <span><?php echo (date("y-m-d",strtotime($vo["post_date"]))); ?></span> </li><?php endforeach; endif; else: echo "" ;endif; ?>

					</ul><div class="clr"></div>
				</div>
				<div class="clr"></div>
			</div>

			<div class="gadget" style="padding:5px ">
				<div style=" float:left">
					<div class="tit_310_2"><span>公司发文</span><span class="mores" ><a href="<?php echo leuu('list/index',array('id'=>12));?>">更多>></a></span></div>
					<div class="clr"></div>
					<ul class="sb_menu2">
						<?php $cat_id = 12; $lists = sp_sql_posts_paged_bycatid($cat_id,"order:recommended DESC,post_date DESC",6); ?>
						<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>

							<li class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>"><?php echo ($vo['post_title']); ?>...
							</a> <span><?php echo (date("y-m-d",strtotime($vo["post_date"]))); ?></span> </li><?php endforeach; endif; else: echo "" ;endif; ?>

					</ul>
				</div>
				<div style=" float:right">
					<div class="tit_310_2"><span>公司制度</span><span class="mores" ><a href="<?php echo leuu('list/index',array('id'=>13));?>">更多>></a></span></div>
					<div class="clr"></div>
					<ul class="sb_menu2">

						<?php $cat_id = 13; $lists = sp_sql_posts_paged_bycatid($cat_id,"order:recommended DESC,post_date DESC",6); ?>
						<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>

							<li class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>"><?php echo ($vo['post_title']); ?>...
							</a> <span><?php echo (date("y-m-d",strtotime($vo["post_date"]))); ?></span> </li><?php endforeach; endif; else: echo "" ;endif; ?>

					</ul>
				</div>
				<div class="clr"></div>
			</div>

			<div class="gadget" style="padding:5px ">
				<div style=" float:left">
					<div class="tit_310_2"><span>党团工作</span><span class="mores" ><a href="<?php echo leuu('list/index',array('id'=>15));?>">更多>></a></span></div>
					<div class="clr"></div>

					<ul class="sb_menu2">

						<?php $cat_id = 15; $lists = sp_sql_posts_paged_bycatid($cat_id,"order:recommended DESC,post_date DESC",6); ?>
						<?php if(is_array($lists['posts'])): $k = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k; $smeta=json_decode($vo['smeta'], true); ?>

							<?php if($k == 1): ?><div class="con_s">




									<img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" />
									<p><span><a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>"><?php echo ($vo["post_title"]); ?></a><br /></span><?php echo ($vo["post_excerpt"]); ?>...</p>
									<div class="clr"></div>
								</div>

								<?php else: ?>


								<li class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>"><?php echo ($vo['post_title']); ?>...
								</a> <span><?php echo (date("y-m-d",strtotime($vo["post_date"]))); ?></span> </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>

					</ul>
				</div>
				<div style=" float:right">
					<div class="tit_310_2"><span>下载中心</span><span class="mores" ><a href="<?php echo leuu('list/index',array('id'=>18));?>">更多>></a></span></div>
					<div class="clr"></div>
					<ul class="sb_menu2">
						<?php $cat_id = 18; $lists = sp_sql_posts_paged_bycatid($cat_id,"order:recommended DESC,post_date DESC",6); ?>
						<?php if(is_array($lists['posts'])): $k = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k; $smeta=json_decode($vo['smeta'], true); ?>

							<?php if($k == 1): ?><div class="con_s">




									<img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" />
									<p><span><a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>"><?php echo ($vo["post_title"]); ?></a><br /></span><?php echo ($vo["post_excerpt"]); ?>...</p>
									<div class="clr"></div>
								</div>

								<?php else: ?>


								<li class="active"><a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>"><?php echo ($vo['post_title']); ?>...
								</a> <span><?php echo (date("y-m-d",strtotime($vo["post_date"]))); ?></span> </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>

					</ul>
				</div>
				<div class="clr"></div>
			</div>

		</div>
		<div class="sidebar">

			<div class="gadget">
				<div class="tit_310"><span>通知公告</span></div>
				<div class="clr"></div>
				<ul class="sb_menu">

					<?php $cat_id = 14; $lists = sp_sql_posts_paged_bycatid($cat_id,"order:recommended DESC,post_date DESC",1); ?>
					<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>

						<div class="tit"><a href="#"><?php echo ($vo["post_title"]); ?></a></div>
						<div class="con"><?php echo ($vo["post_excerpt"]); ?>
						</div><?php endforeach; endif; else: echo "" ;endif; ?>


					<div class="more"><a href="<?php echo leuu('list/index',array('id'=>14));?>">查看更多</a></div>
				</ul>
			</div>

			<div class="gadget" style="padding:3px 0">
				<a href="#"><img src="/themes/simplebootx/Public/assets/images/img01.jpg" /></a>
			</div>

			<div class="gadget">
				<div class="tit_310"><span>本月热门</span></div>
				<div class="clr"></div>
				<ul class="sb_menu2">

					<?php $hot_articles=sp_sql_posts("field:post_title,post_date,post_excerpt,object_id,term_id,smeta;order:post_hits desc;limit:5;"); ?>
					<?php if(is_array($hot_articles)): foreach($hot_articles as $key=>$vo): $top=$key<3?"top3":""; ?>

						<li><a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>"><?php echo ($vo["post_title"]); ?>
						</a> <span><?php echo (date("y-m-d",strtotime($vo["post_date"]))); ?></span> </li><?php endforeach; endif; ?>



				</ul>
			</div>

		</div>
		<div class="clr"></div>
	</div>


	
<div class="link">
	<div class="link_con">友情链接</div>


	<div class="link_con2">

		<?php $links=sp_getlinks(); ?>
		<?php if(is_array($links)): foreach($links as $key=>$vo): ?><a href="<?php echo ($vo["link_url"]); ?>" target="<?php echo ($vo["link_target"]); ?>"><?php echo ($vo["link_name"]); ?></a><?php endforeach; endif; ?>
	</div>


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