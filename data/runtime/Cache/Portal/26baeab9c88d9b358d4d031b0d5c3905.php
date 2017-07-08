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


    <style>
        #slides {
            display: none
        }

        #slides .slidesjs-navigation {
            margin-top:5px;
        }

        a.slidesjs-next,
        a.slidesjs-previous,
        a.slidesjs-play,
        a.slidesjs-stop {
            background-image: url(/themes/simplebootx/Public/assets/images/btns-next-prev.png);
            background-repeat: no-repeat;
            display:block;
            width:12px;
            height:18px;
            overflow: hidden;
            text-indent: -9999px;
            float: left;
            margin-right:5px;
        }

        a.slidesjs-next {
            margin-right:10px;
            background-position: -12px 0;
        }

        a:hover.slidesjs-next {
            background-position: -12px -18px;
        }

        a.slidesjs-previous {
            background-position: 0 0;
        }

        a:hover.slidesjs-previous {
            background-position: 0 -18px;
        }

        a.slidesjs-play {
            width:15px;
            background-position: -25px 0;
        }

        a:hover.slidesjs-play {
            background-position: -25px -18px;
        }

        a.slidesjs-stop {
            width:18px;
            background-position: -41px 0;
        }

        a:hover.slidesjs-stop {
            background-position: -41px -18px;
        }

        .slidesjs-pagination {
            margin: 7px 0 0;
            float: right;
            list-style: none;
        }

        .slidesjs-pagination li {
            float: left;
            margin: 0 1px;
        }

        .slidesjs-pagination li a {
            display: block;
            width: 13px;
            height: 0;
            padding-top: 13px;
            background-image: url(/themes/simplebootx/Public/assets/images/pagination.png);
            background-position: 0 0;
            float: left;
            overflow: hidden;
        }

        .slidesjs-pagination li a.active,
        .slidesjs-pagination li a:hover.active {
            background-position: 0 -13px
        }

        .slidesjs-pagination li a:hover {
            background-position: 0 -26px
        }

        #slides a:link,
        #slides a:visited {
            color: #333
        }

        #slides a:hover,
        #slides a:active {
            color: #9e2020
        }

        .navbar {
            overflow: hidden
        }

        #slides {
            display: none
        }

        .container {
            margin: 0 auto
        }

        /* For tablets & smart phones */
        @media (max-width: 767px) {
            body {
                padding-left: 20px;
                padding-right: 20px;
            }
            .container {
                width: auto
            }
        }

        /* For smartphones */
        @media (max-width: 480px) {
            .container {
                width: auto
            }
        }

        /* For smaller displays like laptops */
        @media (min-width: 768px) and (max-width: 979px) {
            .container {
                width: 724px
            }
        }

        /* For larger displays */
        @media (min-width: 1200px) {
            .container {
                width: 975px
            }
        }
        a.slidesjs-navigation{
            display: none;
        }
    </style>

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


<script type="text/javascript">
//全局变量
var GV = {
    ROOT: "/",
    WEB_ROOT: "/",
    JS_ROOT: "public/js/"
};
</script>
   <!-- Placed at the end of the document so the pages load faster -->
   <script src="/public/js/jquery.js"></script>

   <script src="/public/js/jquery.slides.min.js"></script>

<script>

//   首页轮播
$(function(){
    $("#slides").slidesjs(
        {
            width:968,
            height:356,
            play: {
                active: true,
                // [boolean] Generate the play and stop buttons.
                // You cannot use your own buttons. Sorry.
                effect: "slide",
                // [string] Can be either "slide" or "fade".
                interval: 5000,
                // [number] Time spent on each slide in milliseconds.
                auto: true,
                // [boolean] Start playing the slideshow on load.
                swap: false,
                // [boolean] show/hide stop and play buttons
                pauseOnHover: false,
                // [boolean] pause a playing slideshow on hover
                restartDelay: 2500
                // [number] restart delay on inactive slideshow
            }
        }
    );
});

</script>


</div>
</body>
</html>