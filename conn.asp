<!-- #include file="SQL.asp" -->
<!-- #include file="Function.asp" -->
<%
response.buffer=true '���û��崦��

'On Error Resume Next
   dim connstr,datapath,conn,dbpath,sql

   datapath="base.accdb"      '·����ʼ����ʹ�÷���\��ʼ
   connstr="Provider=microsoft.ace.oledb.12.0;Data Source=" & Server.mappath(datapath)&";Persist Security Info=False;"
' �����access2007�Ժ�汾����Ҫ��Ӧ���޸�Ϊprovider=microsoft.ace.oledb.12.0
'2007��ǰ�޸�Ϊ
'connstr="Provider=Microsoft.JET.OLEDB.4.0;Data Source=" & Server.mappath(datapath) &";Persist Security Info=False;"

   Set conn=Server.CreateObject("ADODB.Connection")
   conn.open connstr

If Err Then
        err.Clear
        Set Conn = Nothing
        Response.Write "���ݿ����ӳ����������ݿ������ļ��е����ݿ�������á�"
        Response.End
    End If 
sub Chkhttp()
server_vv=len(Request.ServerVariables("SERVER_NAME"))
server_v1=left(Cstr(Request.ServerVariables("HTTP_REFERER")),server_vv)
server_v2=left(Cstr("http://"&Request.ServerVariables("SERVER_NAME")),server_vv)
if server_v1<>server_v2 or server_v1="" or server_v1="" then
response.Charset="gb2312"
response.write("<script>alert('���󣺽�ֹ��վ���ⲿ�ύ����!.')</script>")
response.end
end if
end sub
%>