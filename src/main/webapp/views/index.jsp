<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

    <meta charset="utf-8">
    <title>ILEARN</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${assetsPath}/css/app.min.css"/>
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>


<jsp:include page="common/header.jsp" />

<div class="main index">
    <div class="contain">
        <div class="container">

            <div class="row floor">

                <div class="col-md-3 all-list">
                    <ul>
                        <li class="list-sky">
                            全部课程
                        </li>


                        <c:forEach items="${secondcates}" var="oneTwo" varStatus="status">
                            <li class="list-head">             <!--这是一个大头！！！！-->
                                <div>
                                    <%--resource/${oneTwo.cate_name}--%>
                                    <a href="${rootPath}/resource/${oneTwo.cate_id}/1">${oneTwo.cate_name}</a>
                                    <ul class="list-inline">
                                        <li>
                                            <c:forEach items="${oneTwo.cate2s}" var="oneTwo_list" begin="0" end="2">
                                                <a href="${rootPath}/resource/${oneTwo_list.cid}/1">
                                                        ${oneTwo_list.cateName}</a>

                                            </c:forEach>
                                        </li>
                                    </ul>
                                </div>

                                <div class="list-menu">
                                    <ul>
                                        <c:forEach items="${oneTwo.children}" var="oneTwo_list" begin="0" end="4">            <%--这里取出了模型中的List--%>
                                        <li class="list-floor">
                                            <div class="floor-head"><strong>${oneTwo_list.cate_name}</strong></div>      <%--右边二级目录测试--%>
                                            <ul class="list-inline floor-menu">
                                                <c:forEach items="${oneTwo_list.cate2s}" var="thirdCate">
                                                    <li class="entry"><a href="${rootPath}/resource/${thirdCate.cid}/1">
                                                    ${thirdCate.cateName}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                </div>

                <div class="col-md-9 tabimg">
                    <%--<div>--%>
                        <%--<ul class="list-inline">--%>
                            <%--<li class="head">免费课程</li><!----%>
                                <%----><li class="head">收费课程</li><!----%>
                                <%----><li class="head">精品课程</li><!----%>
                                <%----><li class="head">考试达人</li>--%>
                        <%--</ul>--%>
                    <%--</div><!----%>
                        <%---->--%><div id="carousel-generic" class="carousel slide photo" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="${assetsPath}/images/02.jpg" alt="...">
                            <div class="carousel-caption">
                                1
                            </div>
                        </div>
                        <div class="item">
                            <img src="${assetsPath}/images/03.jpg" alt="...">
                            <div class="carousel-caption">
                                2
                            </div>
                        </div>
                        <div class="item">
                            <img src="${assetsPath}/images/04.jpg" alt="...">
                            <div class="carousel-caption">
                                3
                            </div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                </div>

                <%--<div class="col-md-3 addimg">--%>
                <%--</div>--%>
            </div>


            <div class="courses-all flex-row">
                <div class="flex-10">


                    <div class="courses">
                        <div class="container-fluid">

                            <div class="row header">
                                <div class="pull-left col-md-3">
                                    <div class="title">IT/互联网</div>
                                </div>
                                <div class="col-md-4">
                                    <ul class="list-inline head-list">
                                        <li>前端开发</li>
                                        <li>后台开发</li>
                                        <li>移动开发</li>
                                    </ul>
                                </div>
                                <div class="col-md-5 more"><a href="${rootPath}/resource/838/1" class="pull-right">&gt;&gt;More</a></div>
                                <!--<div class="clearfix"></div>-->
                            </div>

                            <div class="row body">

                                <div class="row">            <%--一列两个--%>
                                    <c:forEach items="${recommend1}" var="img_set" begin="0" end="1">
                                        <div class="col-md-6">
                                            <div class="col-md-6">
                                                <img src="${img_set.imgurl}" alt="" style="width: 100%"/>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="info">
                                                    <div class="title">
                                                        <a href="${img_set.url}">${img_set.title}</a>
                                                    </div>
                                                    <div class="addon">
                                                            <%--<div class="time"><i class="fa fa-clock-o"></i>48课时</div>--%>
                                                        <div class="people"><i class="fa fa-user"></i>&nbsp;&nbsp;${img_set.joinNumber}人在学</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="row">            <%--一列两个--%>
                                    <c:forEach items="${recommend1}" var="img_set" begin="2" end="3">
                                        <div class="col-md-6">
                                            <div class="col-md-6">
                                                <img src="${img_set.imgurl}" alt="" style="width: 100%"/>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="info">
                                                    <div class="title">
                                                        <a href="${img_set.url}">${img_set.title}</a>
                                                    </div>
                                                    <div class="addon">
                                                            <%--<div class="time"><i class="fa fa-clock-o"></i>48课时</div>--%>
                                                        <div class="people"><i class="fa fa-user"></i>&nbsp;&nbsp;${img_set.joinNumber}人在学</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="courses">
                        <div class="container-fluid">

                            <div class="row header">
                                <div class="pull-left col-md-3">
                                    <div class="title">语言留学</div>
                                </div>
                                <div class="col-md-4">
                                    <ul class="list-inline head-list">
                                        <li>英语</li>
                                        <li>出国留学</li>
                                        <li>国内考试</li>
                                    </ul>
                                </div>
                                <div class="col-md-5 more"><a href="${rootPath}/resource/839/1" class="pull-right">&gt;&gt;More</a></div>
                                <!--<div class="clearfix"></div>-->
                            </div>

                            <div class="row body">

                                <div class="row">            <%--一列两个--%>
                                    <c:forEach items="${recommend2}" var="img_set" begin="0" end="1">
                                        <div class="col-md-6">
                                            <div class="col-md-6">
                                                <img src="${img_set.imgurl}" alt="" style="width: 100%"/>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="info">
                                                    <div class="title">
                                                           <a href="${img_set.url}">${img_set.title}</a>
                                                    </div>
                                                    <div class="addon">
                                                        <%--<div class="time"><i class="fa fa-clock-o"></i>48课时</div>--%>
                                                        <div class="people"><i class="fa fa-user"></i>&nbsp;&nbsp;${img_set.joinNumber}人在学</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="row">            <%--一列两个--%>
                                    <c:forEach items="${recommend2}" var="img_set" begin="2" end="3">
                                        <div class="col-md-6">
                                            <div class="col-md-6">
                                                <img src="${img_set.imgurl}" alt="" style="width: 100%"/>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="info">
                                                    <div class="title">
                                                        <a href="${img_set.url}">${img_set.title}</a>
                                                    </div>
                                                    <div class="addon">
                                                            <%--<div class="time"><i class="fa fa-clock-o"></i>48课时</div>--%>
                                                        <div class="people"><i class="fa fa-user"></i>&nbsp;&nbsp;${img_set.joinNumber}人在学</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>

                <div class="recommend-all flex-4">
                    <div class="recommend">
                        <div class="title">发掘</div>

                        <div class="recommend-body">
                            <div class="free-all">
                                <div class="free">
                                    <div>免费</div>
                                    <div>课程</div>
                                </div>
                                <div class="article pull-right">
                                    <ul>
                                        <li><a href="">月薪过万的设计师养成记</a></li>
                                        <li><a href="">8小时学会HTML网页开发</a></li>
                                        <li><a href="">一天玩转MySQL</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="good-all">
                                <div class="good">
                                    <div>精品</div>
                                    <div>课程</div>
                                </div>
                                <div class="article pull-right">
                                    <ul>
                                        <li><a href="">月薪过万的设计师养成记</a></li>
                                        <li><a href="">8小时学会HTML网页开发</a></li>
                                        <li><a href="">一天玩转MySQL</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="fire-all">
                                <div class="fire">
                                    <div>热门</div>
                                    <div>课程</div>
                                </div>
                                <div class="article pull-right">
                                    <ul>
                                        <li><a href="">月薪过万的设计师养成记</a></li>
                                        <li><a href="">8小时学会HTML网页开发</a></li>
                                        <li><a href="">一天玩转MySQL</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>


                    <div class="recommend-2 flex-col">
                        <div class="title">
                            <ul>
                                <li class="article recommend-title-active">文章</li>
                                <li class="plan">计划</li>
                            </ul>
                        </div>
                        <div class="list-article">
                            <ul>
                                <li><a href="">1.这里是文章</a></li>
                                <li><a href="">2.Cursor:url()的使用</a></li>
                                <li><a href="">3.Java基本数据类型与包装类、字符串之间的转换dafadfasfasdfasdfasdf</a></li>
                                <li><a href="">4.ImageView自动来回循环移动,用到Animation</a></li>
                                <li><a href="">5.关于JDBC的连接深入理解</a></li>
                                <a href="" class="more pull-right">&gt;&gt;More</a>
                            </ul>
                        </div>
                        <div class="list-plan">
                            <ul>
                                <li><a href="">1.这里是计划</a></li>
                                <li><a href="">2.Cursor:url()的使用</a></li>
                                <li><a href="">3.Java基本数据类型与包装类、字符串之间的转换dafadfasfasdfasdfasdf</a></li>
                                <li><a href="">4.ImageView自动来回循环移动,用到Animation</a></li>
                                <li><a href="">5.关于JDBC的连接深入理解</a></li>
                                <a href="" class="more pull-right">&gt;&gt;More</a>
                            </ul>
                        </div>
                    </div>

                    <script>
                        $(document).ready(function () {
                            $(".article").click(function(){
                                $(".list-article").fadeIn(500);
                                $(".list-plan").hide();
                                $(this).addClass("recommend-title-active");
                                $(".plan").removeClass("recommend-title-active");

                            });
                            $(".plan").click(function(){
                                $(".list-article").hide();
                                $(".list-plan").fadeIn(500);
                                $(this).addClass("recommend-title-active");
                                $(".article").removeClass("recommend-title-active");
                            });

                        });
                    </script>

                </div>
            </div>



        </div>
    </div>
</div>


<jsp:include page="common/footer.jsp" />

<script>
    $(document).ready(function () {
        $(".list-head").mouseenter(function () {
            $(this).find(".list-menu").show();
        });
        $(".list-head").mouseleave(function () {
            $(this).find(".list-menu").hide();
        });
        $(".list-menu").mouseover(function () {
            $(this).show();
        })
        $(".list-menu").mouseleave(function () {
            $(this).hide();
        })
    });
</script>
<script>
    //弹出层
    function openLogin() {
        $('.modal-dialog-mask').fadeIn(100);
        $("#login").slideDown(400);
    }
    function closeLogin() {
        $('.modal-dialog-mask').fadeOut(100);
        $("#login").slideUp(400);
    }

    function openRegister() {
        $('.modal-dialog-mask').fadeIn(100);
        $("#register").slideDown(400);
    }
    function closeRegister() {
        $('.modal-dialog-mask').fadeOut(100);
        $("#register").slideUp(400);
    }

    $("#login .re-register").click(function () {
        $("#login").css("display","none");
        $("#register").css("display","block");
    });
    $("#register .re-login").click(function () {
        $("#login").css("display","block");
        $("#register").css("display","none");
    });
</script>
</body>
</html>