<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scm" runat="server" EnablePageMethods="true" />
        <div>
            <input type="button" id="fileButton" value="Bind Data" />
        </div>
        <div>
            <input type="text" runat="server" class="form-control" id="txtTitle" clientidmode="Static" />
        </div>
        <div>
            <asp:Button ID="btnPostData" runat="server" OnClick="btnPostData_Click" Text="Post Data" />
        </div>
    </form>
</body>
<script>
    $(document).ready(function () {
        $('#fileButton').on('click', function () {
            $.ajax({
                type: 'POST',
                url: '<%= Page.ResolveUrl("~/WebForm1.aspx/BindDataWebMethod")%>',
                data: '{ }',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    var result = JSON.parse(response.d);

                    $('#txtTitle').val(result.title);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    }); 
</script>
</html>
