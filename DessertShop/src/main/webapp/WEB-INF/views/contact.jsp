<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="entity.*" %>
<!-- import="vo.*" -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Contact</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<!--theme-style-->
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 












</script>
<!--fonts-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easydropdown.js"></script>

<!--script-->

</head>
<body>
	<!--header-->
	<div class="header">
		<div class="top-header">
			<div class="container">
				<div class="top-header-left">
					<ul class="support">
						<li><a href="#"><label> </label></a></li>
						<li><a href="#">24x7 服务支持<span class="live">
									</span></a></li>
					</ul>
					<ul class="support">
						<li class="van"><a href="#"><label> </label></a></li>
						<li><a href="#">已全面覆盖全国各大中小城市 <span class="live">
									</span></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="top-header-right">
					<div class="down-top">

						<select tabindex="4" class="dropdown">
							<option value="" class="label" value="">English</option>
							<option value="1">Japanese</option>
							<option value="2">French</option>
							<option value="3">German</option>
						</select>
					</div>
					<div class="down-top top-down">

						<select tabindex="4" class="dropdown ">
							<option value="" class="label" value="">Currency :USD</option>
							<option value="1">Dollar</option>
							<option value="2">Euro</option>
						</select>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="bottom-header">
			<div class="container">
				<div class="header-bottom-left">
					<div class="logo">
						<a href="index.html"><img
							src="<%=request.getContextPath()%>/images/logo.png" alt=" " /></a>
					</div>
					<div class="search">
						<!-- <input type="text" value="" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = '';}"> <input
							type="submit" value="查询"> -->

						<form action="<%=request.getContextPath()%>/Dessert/Query"
							method="post">
							<input type="text" value="" name="keyword"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = '';}"> <input
								type="submit" value="查询">

						</form>  


					</div>
					<div class="clearfix"></div>
				</div>
				<div class="header-bottom-right">
					<ul class="men-grid">
						<%
							User user = (User) session.getAttribute("user");
							if (user != null) {
						%>
						<li><a href="login.html"><span> </span>${user.getUsername() }</a></li>
						<li class="login"><a
							href="<%=request.getContextPath()%>/Dessert/Index"><span>
							</span>注销</a></li>
						<li class="cart"><a href="#"><span> </span>购物车</a></li>
						<%
							} else {
						%>
						<li><a href="<%=request.getContextPath()%>/Account/Login"><span>
							</span>登录</a></li>
						<li class="login"><a
							href="<%=request.getContextPath()%>/Account/Register"><span>
							</span>注册</a></li>
						<%
							}
						%>

					</ul>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!---->
	<div class="container">

		<!---->
		<div class="main">
			<div class="reservation_top">
				<div class=" contact_right">
					<h3>我的购物车</h3>
					<div class="contact-form">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">用户ID</th>
									<th scope="col">商品名称</th>
									<th scope="col">商品类别</th>
									<th scope="col">商品原价</th>
									<th scope="col">商品折扣</th>
									<th scope="col">折扣价格</th>
									<th scope="col">购买数量</th>
									<th scope="col">总共花费</th>
									<th scope="col">选择</th>


								</tr>
							</thead>
							<tbody id="tab">
					
								<c:forEach items="${carts }" var="cartsList">

									 <tr>
										<td class="row">${user.getId() }</td>
										<td class="row">${cartsList.getName() }</td>
										<td class="row">${cartsList.getType() }</td>
										<td class="row">${cartsList.getPrice() }</td>
										<td class="row">${cartsList.getRebate() }%</td>
										<td class="row">${cartsList.getRebate()/100*cartsList.getPrice() }</td>
										<c:forEach items="${cartNum }" var="cartNum">
											<c:if
												test="${cartNum.getDessertId() == cartsList.getId()  && cartNum.getUserId() == userId }">
												<td class="row">${cartNum.getNum() }</td>
												<td class="row">${cartsList.getRebate()/100*cartsList.getPrice() * cartNum.getNum() }</td>
											</c:if>
										</c:forEach>
										<td class="row"><input type="checkbox" id="check" name="delect"
											checked="checked"></td>

									</tr> 
								</c:forEach>
							</tbody>

						</table>

						<input type="button" id="bt1" value="结算">
						<input type="button" id="bt2" value="删除">




					</div>
				</div>
			</div>
		</div>
		<div class="sub-cate">
			<div class=" top-nav rsidebar span_1_of_left">
				<h3 class="cate">CATEGORIES</h3>
				<ul class="menu">


						<ul class="kid-menu ">
							<li><a href="<%=request.getContextPath()%>/Dessert/Type?typeWord=1">手机</a></li>
							<li><a href="<%=request.getContextPath()%>/Dessert/Type?typeWord=2">电脑</a></li>
							<li><a href="<%=request.getContextPath()%>/Dessert/Type?typeWord=3">男装</a></li>
							<li><a href="<%=request.getContextPath()%>/Dessert/Type?typeWord=4">女装</a></li>
							<li><a href="<%=request.getContextPath()%>/Dessert/Type?typeWord=5">数码</a></li>
							<li><a href="<%=request.getContextPath()%>/Dessert/Type?typeWord=6">日用品</a></li>
							<li><a href="<%=request.getContextPath()%>/Dessert/Type?typeWord=7">零食</a></li>
						</ul>
					</ul>
			</div>
			<!--initiate accordion-->
			<script type="text/javascript">
				$(function() {
					var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');
					menu_ul.hide();
					menu_a.click(function(e) {
						e.preventDefault();
						if (!$(this).hasClass('active')) {
							menu_a.removeClass('active');
							menu_ul.filter(':visible').slideUp('normal');
							$(this).addClass('active').next().stop(true, true)
									.slideDown('normal');
						} else {
							$(this).removeClass('active');
							$(this).next().stop(true, true).slideUp('normal');
						}
					});

				});
			</script>
			<div class=" chain-grid menu-chain">
				<a href="single.html"><img class="img-responsive chain"
					src="<%=request.getContextPath()%>/images/timg1.jpg" alt=" " /></a>
				<div class="grid-chain-bottom chain-watch">
					<span class="actual dolor-left-grid">300$</span> <span
						class="reducedfrom">500$</span>
					<h6>Lorem ipsum dolor</h6>
				</div>
			</div>
			<a class="view-all all-product" href="product.html">VIEW ALL
				PRODUCTS<span> </span>
			</a>
		</div>
	</div>
	<!---->
	<div class="footer">
		<div class="footer-top">
			<div class="container">
				<div class="latter">
					<h6>NEWS-LATTER</h6>
					<div class="sub-left-right">
						<form action="<%=request.getContextPath()%>/Dessert/Query"
							method="post">
							<input type="text" value="" name="keyword"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = '';}"> <input
								type="submit" value="查询">

						</form> 
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="latter-right">
					<p>FOLLOW US</p>
					<ul class="face-in-to">
						<li><a href="#"><span> </span></a></li>
						<li><a href="#"><span class="facebook-in"> </span></a></li>
						<div class="clearfix"></div>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<div class="footer-bottom-cate">
					<h6>CATEGORIES</h6>
					<ul>
						<li><a href="#">Curabitur sapien</a></li>
						<li><a href="#">Dignissim purus</a></li>
						<li><a href="#">Tempus pretium</a></li>
						<li><a href="#">Dignissim neque</a></li>
						<li><a href="#">Ornared id aliquet</a></li>
						<li><a href="#">Ultrices id du</a></li>
						<li><a href="#">Commodo sit</a></li>
						<li><a href="#">Urna ac tortor sc</a></li>
						<li><a href="#">Ornared id aliquet</a></li>
						<li><a href="#">Urna ac tortor sc</a></li>
						<li><a href="#">Eget nisi laoreet</a></li>
						<li><a href="#">Faciisis ornare</a></li>
					</ul>
				</div>
				<div class="footer-bottom-cate bottom-grid-cat">
					<h6>FEATURE PROJECTS</h6>
					<ul>
						<li><a href="#">Curabitur sapien</a></li>
						<li><a href="#">Dignissim purus</a></li>
						<li><a href="#">Tempus pretium</a></li>
						<li><a href="#">Dignissim neque</a></li>
						<li><a href="#">Ornared id aliquet</a></li>
						<li><a href="#">Ultrices id du</a></li>
						<li><a href="#">Commodo sit</a></li>
					</ul>
				</div>
				<div class="footer-bottom-cate">
					<h6>TOP BRANDS</h6>
					<ul>
						<li><a href="#">Curabitur sapien</a></li>
						<li><a href="#">Dignissim purus</a></li>
						<li><a href="#">Tempus pretium</a></li>
						<li><a href="#">Dignissim neque</a></li>
						<li><a href="#">Ornared id aliquet</a></li>
						<li><a href="#">Ultrices id du</a></li>
						<li><a href="#">Commodo sit</a></li>
						<li><a href="#">Urna ac tortor sc</a></li>
						<li><a href="#">Ornared id aliquet</a></li>
						<li><a href="#">Urna ac tortor sc</a></li>
						<li><a href="#">Eget nisi laoreet</a></li>
						<li><a href="#">Faciisis ornare</a></li>
					</ul>
				</div>
				<div class="footer-bottom-cate cate-bottom">
					<h6>OUR ADDERSS</h6>
					<ul>
						<li>Aliquam metus dui.</li>
						<li>orci, ornareidquet</li>
						<li>ut,DUI.</li>
						<li>nisi, dignissim</li>
						<li>gravida at.</li>
						<li class="phone">PH : 6985792466</li>
						<li class="temp">
							<p class="footer-class">
								Copyright &copy; 2015.Company name All rights reserved.More
								Templates <a href="http://www.cssmoban.com/" target="_blank"
									title="模板之家">模板之家</a> - Collect from <a
									href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
							</p>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var result = [];

		$("#bt1").click(
						function() {
							//var trs = $("#tab tr");

							var result = [];
							var tbody = document.getElementById("tab");
							var rows = tbody.rows;
							var rows_array = Array.from(rows);
							rows_array.forEach(function(val) {
										var obj = {};
										obj.userId = val.cells[0].innerHTML;
										obj.name = val.cells[1].innerHTML;
										obj.type = val.cells[2].innerHTML;
										obj.price = val.cells[3].innerHTML;
										obj.rebate = val.cells[4].innerHTML;
										obj.money = val.cells[5].innerHTML;
										obj.num = val.cells[6].innerHTML;
										obj.allMoney = val.cells[7].innerHTML;
										obj.isChoose = val.cells[8].children.check.checked ? 1
												: 0;
										
										result.push(obj);
									});
							

							var jsonData = {
								"orderList" : result
							}
							
							$.ajax({
										type : "post",
										url : "/DessertShop/Dessert/Order",
										contentType : "application/json;charset=UTF-8",
										data : JSON.stringify(jsonData),
										success : function(data) {
											if (data != "")
												alert(""+ JSON.stringify(jsonData));
											
											window.location.href = "/DessertShop/Dessert/ToOrder";
										},
										error : function() {
											alert("error"+ JSON.stringify(jsonData));

										}

									})
						});
	</script>
	<script type="text/javascript">
	$(function(){  
	    $("#bt2").click(function() {
	        $("input[name='delect']:checked").each(function() { // 遍历选中的checkbox
	            n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
	            console.log(n);
	            $("tbody#tab").find("tr:eq("+n+")").remove();
	        });
	    });
	});
	
	</script>



</body>

</body>
</html>