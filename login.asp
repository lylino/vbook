
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
	
		Response.Write("<script>alert('�û��������벻��Ϊ�գ�');</script>")
		
    elseif len(userN)<>10 or left(userN,5)<>"21201" then
	
		Response.Write("<script>alert('��Ч���û���������ѧ�ŵ�¼��');</script>")
		
	else
	
		commandStr = "select * from users where uID='" & userN &"' and "&"uPassword='" &psw&"'"
		set rs = conn.Execute(commandStr)
		
		if not rs.EOF then									'�����¼��Ϊ��
		
			Response.Redirect "index.asp"				'��¼�ɹ�
			session("username") = userN  				'��ŵ�½���û���
			
		else                                            '�����¼��Ϊ��,��鿴�Ƿ�Ϊ�״ε�¼
		
			commandStr = "select * from users where uID='" & userN &"'"
			set rs = conn.Execute(commandStr)
			
			if rs.EOF and userN = psw then               '��¼Ϊ�����˺ź������Ϊѧ�� 
			
				commandStr = "insert into users (uID,uPassword) values ('"&userN&"',"&psw&")"
				conn.Execute commandStr						'���ݿ���������û�
				Response.Redirect "pswChangeHtm.asp"			'��¼�ɹ��������޸�����
				
			else
				Response.write("��Ч���û��������룡") 
			end if
		end if
	end if
	
    conn.close
    Set conn = nothing
%>
</body>
</html>
	