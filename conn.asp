<!-- #include file="SQL.asp" -->
<!-- #include file="Function.asp" -->
<%
response.buffer=true '启用缓冲处理

'On Error Resume Next
   dim connstr,datapath,conn,dbpath,sql

   datapath="base.accdb"      '路径开始必须使用符号\开始
   connstr="Provider=microsoft.ace.oledb.12.0;Data Source=" & Server.mappath(datapath)&";Persist Security Info=False;"
' 如果是access2007以后版本，需要相应的修改为provider=microsoft.ace.oledb.12.0
'2007年前修改为
'connstr="Provider=Microsoft.JET.OLEDB.4.0;Data Source=" & Server.mappath(datapath) &";Persist Security Info=False;"

   Set conn=Server.CreateObject("ADODB.Connection")
   conn.open connstr

If Err Then
        err.Clear
        Set Conn = Nothing
        Response.Write "数据库连接出错，请检查数据库连接文件中的数据库参数设置。"
        Response.End
    End If 
sub Chkhttp()
server_vv=len(Request.ServerVariables("SERVER_NAME"))
server_v1=left(Cstr(Request.ServerVariables("HTTP_REFERER")),server_vv)
server_v2=left(Cstr("http://"&Request.ServerVariables("SERVER_NAME")),server_vv)
if server_v1<>server_v2 or server_v1="" or server_v1="" then
response.Charset="gb2312"
response.write("<script>alert('错误：禁止从站点外部提交数据!.')</script>")
response.end
end if
end sub
%>