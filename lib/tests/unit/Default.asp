<%@ LANGUAGE="VBScript" %>

<!-- #include file="../lib/ASPUnit/include/ASPUnitRunner.asp" -->
<!-- METADATA TYPE="typelib" FILE="C:\Program Files\Common Files\System\ado\msado15.dll" -->
<!-- #include file="post.asp" -->
<%
' test runner
Dim runner
Set runner = New UnitRunner
Call runner.AddTestContainer(New PostTest)

Call runner.Display()
%>