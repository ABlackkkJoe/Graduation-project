<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>中北大学一卡通数据分析系统与展示</title>
<!--mobile apps-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--mobile apps-->
<!--Custom Theme files-->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="css/swipebox.css">
<!--//Custom Theme files-->
<!--js-->
<script src="js/jquery-1.11.1.min.js"></script> 
<!-- //js -->
<!--web-fonts-->
<link href='https://fonts.googleapis.com/css?family=Overlock:400,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//web-fonts-->
<!--start-smooth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!--//end-smooth-scrolling-->
</head>
<body>
	<!--banner-->
	<div id="home" class="banner">
		<div class="banner-info">
			<div class="container">
				<div class="col-md-4 header-left">
					<img src="images/img1.jpg" alt=""/>
				</div>
				<div class="col-md-8 header-right">
					<h2>Hello</h2>
					<h1>中北大学一卡通数据分析系统与展示</h1>
					<h6>14140Y01班张丹</h6>
					<ul class="address">
						
						<li>
							<ul class="address-text">
								<li><b>PHONE </b></li>
								<li>15035391262</li>
							</ul>
						</li>
						<li>
							<ul class="address-text">
								<li><b>SCHOOL </b></li>
								<li>中北大学软件学院.</li>
							</ul>
						</li>
						<li>
							<ul class="address-text">
								<li><b>E-MAIL </b></li>
								<li><a href="mailto:example@mail.com"> 1071102546@qq.com</a></li>
							</ul>
						</li>
						<li>
							<ul class="address-text">
								<li><b>WEBSITE </b></li>
								<li><a href="http://w3layouts.com">www.ocpro.cc/nuc_card</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--//banner-->
	<!--top-nav-->
	<div class="top-nav wow">
		<div class="container">
			<div class="navbar-header logo">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					Menu
				</button>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<div class="menu">
					<ul class="nav navbar">
						<li><a href="#about" class="scroll">Home</a></li>
						<li><a href="#work" class="scroll">Analyze</a></li>
						<li><a href="#projects" class="scroll">Visualize</a></li>
						<li><a href="${pageContext.request.contextPath}／login.jsp" class="scroll">Login</a></li>
						<li><a href="#contact" class="scroll">About</a></li>
					</ul>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>	
	<!--//top-nav-->
	<!--about-->
	<div id="about" class="about">
		<div class="container">
			<h3 class="title"> Home</h3>
			<div class="col-md-8 about-left">
				<p>本系统采用WEB与移动微信小程序相结合完成大学生一卡通数据分析系统，使用户能够利用此系统清晰的了解该系统的设计思想和一卡通数据的分析情况，为个人生活和工作带来便利。用户能够通过WEB查看系统；各个角色的用户可以在登录界面进行登录、可以从时间维度、消费类型维度、POS机维度、年级专业班级维度等对数据可视化、修改个人信息；系统管理员可对用户做增删改查操作；该系统实现者对一卡通数据预处理,将一卡通数据提交给Hadoop集群实现存储和分析,并通过不同维度对数据可视化展示。运用大数据和可视化技术能够提高研究一卡通消费数据情况的能力和水平.</p>
			</div>
			<div class="col-md-4 about-right">
				<ul>
					<h5>用户角色：</h5>
					<li><span class="glyphicon glyphicon-menu-right"></span> 在校学生</li>
					<li><span class="glyphicon glyphicon-menu-right"></span> 学院管理员</li>
					<li><span class="glyphicon glyphicon-menu-right"></span> 后勤管理员</li>
					<li><span class="glyphicon glyphicon-menu-right"></span> 系统管理员</li>
				</ul>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//about-->
	<!--work-experience-->
	<div id="work" class="work">
		<div class="container">
			<h3 class="title">Aanlyze</h3>
			<div class="work-info"> 
				<div class="col-md-6 work-left"> 
					<h4>Hadoop架构技术 </h4>
				</div>
				<div class="col-md-6 work-right"> 
					<h5><span class="glyphicon glyphicon-briefcase"> </span> Hadoop集群</h5>
					<p>利用HDFS技术实现一卡通数据的存储、Hive和MySQL技术实现一卡通数据的统计和分析。</p>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="work-info"> 
				<div class="col-md-6 work-right work-right2"> 
					<h4>JAVA WEB </h4>
				</div>
				<div class="col-md-6 work-left work-left2"> 
					<h5> Servlet <span class="glyphicon glyphicon-briefcase"> </span></h5>
					<p>WEB做后台页面管理。</p>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="work-info"> 
				<div class="col-md-6 work-left"> 
					<h4>聚类算法 </h4>
				</div>
				<div class="col-md-6 work-right"> 
					<h5><span class="glyphicon glyphicon-briefcase"> </span> K-MEANS算法</h5>
					<p>K-MEANS算法分析一卡通数据得出3类消费水平。</p>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="work-info"> 
				<div class="col-md-6 work-right work-right2"> 
					<h4>数据可视化 </h4>
				</div>
				<div class="col-md-6 work-left work-left2"> 
					<h5> Echarts、Matplotlib <span class="glyphicon glyphicon-briefcase"></span> </h5>
					<p>Matplotlib和Echarts对各类消费数据进行可视化。 </p>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="work-info"> 
				<div class="col-md-6 work-left"> 
					<h4>微信一卡通小程序 </h4>
				</div>
				<div class="col-md-6 work-right"> 
					<h5><span class="glyphicon glyphicon-briefcase"> </span> 前后台交互</h5>
					<p>移动端微信一卡通小程序模拟用户行为并与WEB端相结合。</p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--//work-experience-->
	
	<!--portfolio-->
	<div id="projects" class="portfolio">
		<div class="container">
			<h3 class="title wow zoomInLeft animated" data-wow-delay=".5s">Visualize</h3>
			<div class="sap_tabs">			
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list wow fadeInUp animated" data-wow-delay=".7s">
						<li class="resp-tab-item"><span>SHOW</span></li>
						<li class="resp-tab-item"><span>学院管理员</span></li>
						<li class="resp-tab-item"><span>系统管理员</span></li>
						<li class="resp-tab-item"><span>在校学生</span></li>
					</ul>	
					<div class="clearfix"> </div>	
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content">
							<div class="tab_img">
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g1.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g1.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>登录页面.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid effect-sarah">
										<a href="images/g2.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g2.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>后台功能.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g3.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g3.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>所有用户信息.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g4.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g4.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>个人每月总支出雷达图展示.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g5.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g5.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>学院餐厅、淋浴、热水三大消费柱状图展示.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g6.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g6.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>K-Means聚类算法对个人进行分类.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g7.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g7.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>淋浴12月每人总消费散点图展示.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g8.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g8.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>个人每人消费K图展示.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g9.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g9.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>用户个人操作.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div class="tab-1 resp-tab-content">
							<div class="tab_img">
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g5.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g5.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>个人月支出雷达图展示.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g6.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g6.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>学院餐饮、淋浴、热水支出柱状图展示.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g7.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g7.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>K-Means聚类算法对用户分类.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div class="tab-1 resp-tab-content">
							<div class="tab_img">
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g3.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g3.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>淋浴12月每人消费总金额散点图展示.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g1.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g1.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>My<span> Project</span></h3>
												<p>Sarah likes to watch clouds. She's quite depressed.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g9.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g9.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>个人每日消费K图展示</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div class="tab-1 resp-tab-content">
							<div class="tab_img">
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g2.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g2.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>放大<span> 查看</span></h3>
												<p>用户个人操作</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g4.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g4.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>My<span> Project</span></h3>
												<p>Sarah likes to watch clouds. She's quite depressed.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="col-md-4 portfolio-grids">
									<div class="grid">
										<a href="images/g8.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
											<img src="images/g8.jpg" alt="" class="img-responsive" />
											<div class="figcaption">
												<h3>My<span> Project</span></h3>
												<p>Sarah likes to watch clouds. She's quite depressed.</p>
											</div>
										</a>	
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--ResponsiveTabs-->
			<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(document).ready(function () {
					$('#horizontalTab').easyResponsiveTabs({
						type: 'default', //Types: default, vertical, accordion           
						width: 'auto', //auto or any width like 600px
						fit: true   // 100% fit in a container
					});
				});		
			</script>
			<!--//ResponsiveTabs-->
			<!-- swipe box js -->
			<script src="js/jquery.swipebox.min.js"></script> 
				<script type="text/javascript">
					jQuery(function($) {
						$(".swipebox").swipebox();
					});
			</script>
			<!-- //swipe box js -->
		</div>
	</div>
	<!--//portfolio-->
	<!--contact -->
	<div class="welcome contact" id="contact">
		<div class="container">
			<h3 class="title">About</h3>
			<div class="contact-row">
				<div class="col-md-6 contact-right">
					<div class="address-left">
						<p>网址输入：<br> www.ocpro.cc/nuc_card </p>
					</div>
					<div class="address-right">
						<p>username : 学号</p>
						<p>password : <a href="mailto:info@example.com">7个0</a></p>
					</div>
					<div class="clearfix"></div>
					
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//contact -->
	<!--footer-->
	<div class="footer">
		<div class="container">
			<p>Copyright &copy; 2018.Company name All rights reserved.More Templates - Collect from 14140Y01班张丹</p>
		</div>
	</div>
	<!--//footer-->
	<!--smooth-scrolling-of-move-up-->
	<script type="text/javascript">
		$(document).ready(function() {
		
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
	<!--//smooth-scrolling-of-move-up-->
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"></script>
</body>
</html>