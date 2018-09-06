<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<%Response.Charset="gb2312"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="shortcut icon" href="img/shortcut.png">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/iconfont.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/mediaQuery.css">
    <link rel="stylesheet" href="css/loginForm.css">
    <link rel="stylesheet" href="css/login.css">

    <title>�ϲ���è��������</title>

    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/html5media.min.js"></script>
    <script src="js/jquery.nav.js"></script>
    <script src="js/index.js"></script>
</head>
<body id="page">

    <div class="page-wrapper">

        <form class="login-form" id="login-form" method="post" action="login.asp">
            <div class="input-line">
                <input type="text" class="form-input check-value" placeholder="" name="nickname">
                <span class="placeholder">�ǳ�</span>
                <span class="bottom-line"></span>
            </div>

            <div class="input-line">
                <input type="password" class="form-input check-value" placeholder="" name="password">
                <span class="placeholder">������</span>
                <span class="bottom-line"></span>
            </div>
			
            <div class="input-line">
                <input type="password" class="form-input check-value" placeholder="" name="password">
                <span class="placeholder">������</span>
                <span class="bottom-line"></span>
            </div>
			
            <div class="input-line">
                <input type="password" class="form-input check-value" placeholder="" name="password">
                <span class="placeholder">������</span>
                <span class="bottom-line"></span>
            </div>

            <div class="btn-wrapper submit-btn-wrapper text-center">
                <input class="btn submit-button chgBgColor" type="submit" value="��¼" />
            </div>
            <span class="register-span text-center">��û��ע�᣿ѧ�ſ���<span class="register-link" >ֱ�ӵ�¼</span>Ŷ~</span>
            <span class="register-des text-center">�״ε�¼�˺������Ϊѧ��</span>
        </form>

        <footer class="main-footer">
            <a class="tab-list" id="home-page-button" href="index.html">
                <i class="tab-icon iconfont">&#xe619;</i>
                <span class="tab-title">��ҳ</span>
            </a>
            <a class="tab-list" id="uploade-button" href="loginAlert.asp">
                <i class="tab-icon iconfont">&#xe6e8;</i>
                <span class="tab-title">����</span>
            </a>
            <a class="tab-list" id="cart-button" href="loginAlert.asp">
                <i class="tab-icon iconfont">&#xe639;</i>
                <span class="tab-title">���ﳵ</span>
            </a>
            <a class="tab-list " id="message-page-button" href="loginAlert.asp">
                <i class="tab-icon iconfont">&#xe617;</i>
                <span class="tab-title">��Ϣ</span>
            </a>
            <a class="tab-list active" id="profile-button" href="loginAlert.asp">
                <i class="tab-icon iconfont">&#xe625;</i>
                <span class="tab-title">�ҵ�</span>
            </a>
        </footer>
    </div>

    <script>
        $(document).ready(function(){
            var winHeight = $(window).height();
            var formHeight = $("#login-form").height();
            var top = (winHeight - formHeight)/2 - 100;
            $("#login-form").css("top",top);
        })
    </script>
</body>
</html>