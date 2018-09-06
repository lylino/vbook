
<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<%Response.Charset="gb2312"%>
<!-- #include file="conn.asp" -->
<html>
<head>
<meta http-equiv="refresh" content="0.5; url=login.html">
</head>
<body>
<% 
    userN = request.form("userName")
    psw   = request.form("password")
	
	
	if userN = "" or psw = "" then
	
		Response.Write("<script>alert('用户名或密码不能为空！');</script>")
		
    elseif len(userN)<>10 or left(userN,5)<>"21201" then
	
		Response.Write("<script>alert('无效的用户名，请用学号登录！');</script>")
		
	else
	
		commandStr = "select * from users where uID='" & userN &"' and "&"uPassword='" &psw&"'"
		set rs = conn.Execute(commandStr)
		
		if not rs.EOF then									'如果记录不为空
		
			Response.Redirect "index.asp"				'登录成功
			session("username") = userN  				'存放登陆的用户名
			
		else                                            '如果记录不为空,则查看是否为首次登录
		
			commandStr = "select * from users where uID='" & userN &"'"
			set rs = conn.Execute(commandStr)
			
			if rs.EOF and userN = psw then               '记录为空且账号和密码均为学号 
			
				commandStr = "insert into users (uID,uPassword) values ('"&userN&"',"&psw&")"
				conn.Execute commandStr						'数据库内添加新用户
				Response.Redirect "pswChangeHtm.asp"			'登录成功，提醒修改密码
				
			else
				Response.write("无效的用户名或密码！") 
			end if
		end if
	end if
	
    conn.close
    Set conn = nothing
%>
</body>
</html>
	