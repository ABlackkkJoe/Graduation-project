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
								<li><a href="http://www.ocpro.cc/nuc_card/">http://www.ocpro.cc/nuc_card/</a></li>
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
						<li><a href="http://www.ocpro.cc/nuc_card/">Login</a></li>
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
				<p>用户能够查看系统界面，用户和管理员的登录界面，每个时间段消费情况的展示以及可视化；上传一卡通数据,能将一卡通数据提交给Hadoop集群进行处理,展示一卡通结果并进行一卡通预测；管理员能够使用增删改查用户信息；用户可以浏览一卡通信息、修改个人信息等功能。</p>
			</div>
			<div class="col-md-4 about-right">
				<ul>
					<h5>Awards</h5>
					<li><span class="glyphicon glyphicon-menu-right"></span> 普通学生</li>
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
					<h4>Hadoop技术 </h4>
				</div>
				<div class="col-md-6 work-right"> 
					<h5><span class="glyphicon glyphicon-briefcase"> </span> Hadoop架构</h5>
					<p>HDFS（Hadoop分布式文件存储系统）:Hadoop生态体系中存储和管理数据的基础。Hadoop生态圈的文件存储系统是一个容错度很高的系统，能够检验和发现文件存储问题，可以在价格较低的普通硬件系统上运行。</p>
<p>MapReduce（分布式离线计算框架）:MapReuce体现了分而治之的思想,可以进行PB级别海量数据的计算和处理,具有良好伸缩性和容错性。Map阶段对海量数据进行操作，生成键值对中间结果。Reduce阶段对Map阶段生成中间结果中相同“键”的所有“值”进行聚合处理，得到需要的数据。</p>
<p>Hive（Hadoop数据仓库）:是大数据中的数据存储仓库，核心数据处理框架是MapReduce，Hive有内置数据库可以进行元数据管理,主要应用于数据的离线处理。Hive还提供了数据仓库功能:数据抽取转化加载,面向主题分析,海量数据的存储，数据查询。利用SQL查询语言，简单容易入手，一定程度上省去了书写代码的过程。</p>
<p>HBase（NoSQL分布式列存数据库）:传统的数据库模型已不能满足一些特定场景的需要,NoSQL的出现很好的解决了传统数据库不能解决的一些问题。HBase可以在大量数据中实现并发读写操作,HBase使存储有了伸缩性，列可以动态的增加，自动切分数据，HBase中的数据使用MapReduce离线计算框架来处理。</p>
<p>Sqoop（数据同步工具）:Sqoop是可以在关系型数据库和Hadoop之间传送数据的工具。例如:可以把MySQL中的数据传送到HDFS,也可以将HDFS上的数据传送到MySQL</p>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="work-info"> 
				<div class="col-md-6 work-right work-right2"> 
					<h4>JAVA WEB </h4>
				</div>
				<div class="col-md-6 work-left work-left2"> 
					<h5> Servlet <span class="glyphicon glyphicon-briefcase"> </span></h5>
					<p>Servlet（Server Applet）是Java Servlet的简称，称为小服务程序或服务连接器，用Java编写的服务器端程序，主要功能在于交互式地浏览和修改数据，生成动态Web内容。</p>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="work-info"> 
				<div class="col-md-6 work-left"> 
					<h4>聚类算法 </h4>
				</div>
				<div class="col-md-6 work-right"> 
					<h5><span class="glyphicon glyphicon-briefcase"> </span> K-MEANS算法</h5>
					<p>K-MEANS算法是聚类分析算法中比较简单和容易使用的算法，主要用来解决数据的聚集问题，适用于处理大量的数据并且算法高效,主要思想是在划分多个中心点，不断取距离中心点最近值的算法。算法的核心在于计算中心点的公式，不同求中心点的算法会有差异,在本系统中可以将距离中心点近的多点归为一类，可以直观的看出一卡通数据的聚类效果。</p>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="work-info"> 
				<div class="col-md-6 work-right work-right2"> 
					<h4>数据可视化技术 </h4>
				</div>
				<div class="col-md-6 work-left work-left2"> 
					<h5> Echarts、Matplotlib <span class="glyphicon glyphicon-briefcase"></span> </h5>
					<p>ECharts，一个使用 JavaScript 实现的开源可视化库，可以流畅的运行在 PC 和移动设备上，兼容当前绝大部分浏览器（IE8/9/10/11，Chrome，Firefox，Safari等），底层依赖轻量级的矢量图形库 ZRender，提供直观，交互丰富，可高度个性化定制的数据可视化图表。 </p>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="work-info"> 
				<div class="col-md-6 work-left"> 
					<h4>微信小程序开发 </h4>
				</div>
				<div class="col-md-6 work-right"> 
					<h5><span class="glyphicon glyphicon-briefcase"> </span> 前后台交互</h5>
					<p>微信用户群体的大量增加，需要微信开发来支持大量的APP应用。小程序是近些年人们热烈谈论的技术，小程序的面世解决传统APP需要下载并且占用手机内存的情况，用户可以通过扫描二维码直接进入APP应用。相比于服务号，小程序开发成本低，易于传播和简单易用。小程序可以个性化自己的服务，简洁的交互页面，提高了用户体验。</p>
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
						<li class="resp-tab-item"><span>All</span></li>
						<li class="resp-tab-item"><span>学院管理员</span></li>
						<li class="resp-tab-item"><span> 系统管理员</span></li>
						<li class="resp-tab-item"><span>普通学生</span></li>					
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
												<p>all用户信息.</p>
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
						<p>username :  学号</p>
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