<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${assetsPath}/css/app.min.css"/>
    <!-- <link rel="stylesheet" href="css/course.css"/> -->
    <!--<script src="./js/jquery-1.7.2.min.js"></script>-->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="${assetsPath}/js/navLink.js"></script>
</head>
<body>
<header>
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-4 logo">
                iLearn
            </div>
            <div class="col-md-4 search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="搜索内容...">
                              <span class="input-group-btn">
                                <button class="btn btn-default" type="button">搜索</button>
                              </span>
                </div><!-- /input-group -->
            </div>
            <div class="col-md-4 button-group">
                <span class="login"><a id="userlogin" href="javascript:void(0)" onclick="openLogin()"><c:if test="${username ==null}">登录</c:if>
                                                                    <c:if test="${username!=null}">${username} </c:if></a></span>
                <span class="registe"><a id="logout" href="javascript:void(0)" onclick="openRegister()">注册</a></span>
            </div>

            <script>
                //            alert($("#nav-login").text());
                if($("#userlogin").text().trim()=="${user}"){
                    $("#userlogin").attr("onclick","window.location.href='/views/user/user-info.jsp'");
                    $("#logout").attr("onclick","window.location.href='${rootPath}/user/logout'");
                }
            </script>

            <div id="modal">
                <!--弹出式登录框-->
                <div class="modal-dialog" id="login">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" onclick="closeLogin()">x</button>
                            <h1 class="text-center text-primary">登录</h1>
                        </div>
                        <div class="modal-body center-block">
                            <form action="" class="form center-block">
                                <div class="input-group">
                                    <!--<label for="examInputEmail1">邮箱:</label>-->
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <input type="text" class="form-control input-lg" id="examInputEmail1" name="username"
                                           placeholder="请输入您的用户名"/>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input type="password" class="form-control input-lg" id="examInputPassword1" name="password"
                                           placeholder="请输入您的密码"/>
                                </div>

                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="登录" id="login-in">
                                    <span><a href="javascript:void(0)" style="text-align: left">找回密码</a></span>
                                    <span><a href="javascript:void(0)" class="pull-right re-register">注册</a></span>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
                <!--注册框-->
                <div class="modal-dialog" id="register">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" onclick="closeRegister()">x</button>
                            <h1 class="text-center text-primary">注册</h1>
                        </div>
                        <div class="modal-body center-block">
                            <form action="" class="form center-block">
                                <div class="input-group">
                                    <!--<label for="examInputEmail1">邮箱:</label>-->
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <input type="email" class="form-control input-lg" id="username"
                                           placeholder="请输入您的用户名"/>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input type="password" class="form-control input-lg" id="password1"
                                           placeholder="请输入您的密码"/>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input type="password" class="form-control input-lg" id="password2"
                                           placeholder="确认密码"/>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                    <input type="password" class="form-control input-lg" id="email"
                                           placeholder="邮箱"/>
                                </div>

                                <div class="form-group">
                                    <button class="btn btn-primary btn-lg btn-block">注册</button>
                                    <span><a href="javascript:void(0)" style="text-align: left">找回密码</a></span>
                                    <span><a href="javascript:void(0)" class="pull-right re-login">登录</a></span>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">

                        </div>
                    </div>
                </div>
                <!--遮罩层-->
                <div class="modal-dialog-mask"></div>
            </div>


        </div>
    </div>

</header>

<div class="main course">
    <div class="contain">
        <div class="container">
            <div class="breadcrumb-main">
                    <ol class="breadcrumb">
                        <li><a href="/">首页</a></li>
                        <li><a href="">课程</a></li>
                        <!--<li class="active"><a href="">所有课程</a></li>-->
                    </ol>
            </div>

            <div class="select-menu">
                <ul class="select">
                    <li class="select-list">
                        <dl id="select1">
                            <dt>领域：</dt>
                            <c:if test="${nowCate1==null}">
                                <c:set var="selectedOfClass" value="select-all selected"></c:set>
                            </c:if>
                            <dd class="${selectedOfClass}"><a href="${rootPath}/resource/course">全部</a></dd>

                            <%--<c:set var="selectedOfClass1" value=""></c:set>--%>
                            <c:forEach items="${secondcates}" var="cate1">
                                <c:if test="${nowCate1.cid == cate1.cate_id}">
                                    <c:set var="selectedOfClass1" value="select-all selected"></c:set>
                                </c:if>
                                <dd class="${selectedOfClass1}"><a href="${rootPath}/resource/${cate1.cate_id}/1">${cate1.cate_name}</a></dd>
                                <c:set var="selectedOfClass1" value=""></c:set>
                            </c:forEach>
                        </dl>
                    </li>



                    <li class="select-list">
                        <dl id="select2">
                            <dt>方向：</dt>

                            <c:forEach items="${secondcates}" var="cate1">
                            <c:if test="${nowCate1.cid == cate1.cate_id}">
                                <c:set var="cate2s" value="${cate1.cate2s}"></c:set>
                            </c:if>
                            </c:forEach>


                            <c:set var="selectedOfClass21" value=""></c:set>
                            <c:set var="cate2Url" value="${rootPath}/resource/${nowCate1.cid}/1"></c:set>

                            <c:if test="${nowCate1==null}">
                                <c:set var="selectedOfClass21" value="select-all selected"></c:set>
                                <c:set var="cate2Url" value="${rootPath}/resource/course"></c:set>
                            </c:if>

                            <c:if test="${nowCate2==null}">
                                <c:set var="selectedOfClass21" value="select-all selected"></c:set>
                                <c:set var="cate2Url" value="${rootPath}/resource/${nowCate1.cid}/1"></c:set>
                            </c:if>
                            <dd class="${selectedOfClass21}"><a href="${cate2Url}">全部</a></dd>

                            <c:if test="${nowCate1==null}">
                                <c:forEach items="${allOfCate2}" var="allcate2" begin="6" end="56">
                                    <dd><a href="${rootPath}/resource/${allcate2.cid}/1">
                                            ${allcate2.cateName}</a></dd>
                                </c:forEach>
                            </c:if>

                            <c:forEach items="${cate2s}" var="cate2">
                                <c:if test="${nowCate2.cid == cate2.cid}">
                                    <c:set var="selectedOfClass22" value="select-all selected"></c:set>
                                </c:if>
                                <dd class="${selectedOfClass22}"><a href="${rootPath}/resource/${cate2.cid}/1">
                                ${cate2.cateName}</a></dd>
                                <c:set var="selectedOfClass22" value=""></c:set>
                            </c:forEach>
                        </dl>
                    </li>


                    <li class="select-list">
                        <dl id="select3">
                            <dt>分类：</dt>

                            <c:forEach items="${secondcates}" var="cate1">
                            <c:forEach items="${cate1.children}" var="cate2">
                                <c:if test="${nowCate2.cid == cate2.cate_id}">
                                    <c:set var="cate3s" value="${cate2.cate2s}"></c:set>
                                </c:if>
                            </c:forEach>
                            </c:forEach>

                            <c:set var="selectedOfClass31" value=""></c:set>
                            <c:set var="cate3Url" value="${rootPath}/resource/${nowCate2.cid}/1"></c:set>

                            <c:if test="${nowCate1==null}">
                                <c:set var="selectedOfClass31" value="select-all selected"></c:set>
                                <c:set var="cate3Url" value="${rootPath}/resource/course"></c:set>
                            </c:if>
                            <c:if test="${nowCate2==null}">
                                <c:set var="selectedOfClass31" value="select-all selected"></c:set>
                                <c:set var="cate3Url" value="${rootPath}/resource/${nowCate1.cid}/1"></c:set>
                            </c:if>
                            <c:if test="${nowCate3==null}">
                                <c:set var="selectedOfClass31" value="select-all selected"></c:set>
                                <c:set var="cate3Url" value="${rootPath}/resource/${nowCate2.cid}/1"></c:set>
                            </c:if>

                            <dd class="${selectedOfClass31}"><a href="${cate3Url}">全部</a></dd>

                            <c:if test="${nowCate1==null}">
                                <c:forEach items="${allOfCate3}" var="allcate3" begin="6" end="56">
                                    <dd><a href="${rootPath}/resource/${allcate3.cid}/1">
                                            ${allcate3.cateName}</a></dd>
                                </c:forEach>
                            </c:if>

                            <c:if test="${nowCate2==null && nowCate1!=null}">
                                <c:forEach items="${allOfCate3OfNowCate1}" var="allcate3" begin="6" end="56">
                                    <dd><a href="${rootPath}/resource/${allcate3.cid}/1">
                                            ${allcate3.cateName}</a></dd>
                                </c:forEach>
                            </c:if>

                            <c:forEach items="${cate3s}" var="cate3">
                                <c:if test="${nowCate3.cid == cate3.cid}">
                                    <c:set var="selectedOfClass32" value="select-all selected"></c:set>
                                </c:if>
                                <dd class="${selectedOfClass32}"><a href="${rootPath}/resource/${cate3.cid}/1">
                                        ${cate3.cateName}</a></dd>
                                <c:set var="selectedOfClass32" value=""></c:set>
                            </c:forEach>
                        </dl>
                    </li>
                    <li class="select-result">
                        <dl>
                            <c:set var="selectResult" value="0"></c:set>
                            <dt>已选条件：</dt>
                            <c:if test="${nowCate1.cateName!='全部' && nowCate1!=null}">
                                <dd>${nowCate1.cateName}</dd>
                                <c:set var="selectResult" value="1"></c:set>
                            </c:if>
                            <c:if test="${nowCate2.cateName!='全部' && nowCate2!=null}">
                                <dd>${nowCate2.cateName}</dd>
                                <c:set var="selectResult" value="1"></c:set>
                            </c:if>
                            <c:if test="${nowCate3.cateName!='全部' && nowCate3!=null}">
                                <dd>${nowCate3.cateName}</dd>
                                <c:set var="selectResult" value="1"></c:set>
                            </c:if>
                            <c:if test="${selectResult!='1'}">
                                <dd class="select-no">暂时没有选择过滤条件</dd>
                            </c:if>
                        </dl>
                    </li>

                </ul>
            </div>


            <!----------------------------
                         body
             ------------------------------->
            <div class="course-body">
                <div class="container">
                    <div class="row">
                        <ul class="list-inline courses-sort">
                            <li>最热</li>
                            <li>最新</li>
                            <li>免费</li>
                        </ul>
                    </div>

                    <div class="floor">
                        <ul>
                            <c:forEach items="${resources}" var="course">
                                <li>
                                    <div class="image">
                                        <img src="${course.imgurl}" alt=""/>
                                    </div>
                                    <div class="title">${course.title}</div>
                                        <%--<div class="price">${coursepage1.price}</div>--%>
                                    <div class="add pull-left">附加信息</div>
                                    <div class="people pull-right">${course.joinNumber}</div>
                                    <div class="clearfix"></div>
                                    <div class="line"></div>
                                    <div class="src">${course.sourceWeb}</div>
                                </li>
                            </c:forEach>

                            <div class="clearfix"></div>
                        </ul>
                    </div>
                </div>
                <nav>
                    <ul class="pagination pull-right">
                        <li><a href="#">上一页</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#">下一页</a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </nav>
            </div>

        </div>

    </div>
</div>


<footer>
    <div class="container site-info">
        <div class="row">
            <div class="col-xs-2"><a href="/"><img src="${assetsPath}/images/logo.png" alt="" width="120"></a></div>
            <div class="col-xs-6">
                <div class="row">
                    <div class="col-xs-6">
                        <h3>统计信息</h3>
                        <p>网站总访问量 : 1365544</p>
                        <p>当前在线人数 : 42554</p>
                        <p>页面加载时间 : 0.000234</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-4 contacts">
                <div class="contact-detail">
                    <p><i class="fa fa-map-marker"></i>江苏省南京市</p>
                    <p><i class="fa fa-phone"></i>123-456-789</p>
                    <p><i class="fa fa-envelope"></i>1234567@qq.com</p>
                </div>
                <span>关注我们:</span>
                <a href=""><i class="contact-icon fa fa-weibo"></i></a>
                <a href=""><i class="contact-icon fa fa-weixin"></i></a>
                <a href=""><i class="contact-icon fa fa-qq"></i></a>
                <a href=""><i class="contact-icon fa fa-renren"></i></a>
            </div>
        </div>
    </div>
    </div>
    <div class="copyright">

        <p>CopyrightBy--Mr.z</p>
    </div>
</footer>

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