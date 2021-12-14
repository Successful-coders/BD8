<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BD_BR5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

                    .flex-start
                    {
                        align-items: flex-start;
                    }
                    .flex-container {
                        display: flex;
                        flex-direction: column;
                        width: 100%;
                    }
                    .center {
                        align-items: center;
                    }
                    </style>
</head>
<body style="height: 427px; width: 738px">
    <form id="form1" runat="server">
        <div>
            8 лабораторная работа. Выполнили: Воронкина Дарья, Кондратьев Игорь.<br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/WebForm2.aspx">Перейти ко 2 запросу.</asp:HyperLink>
            <br />
            Получить информацию о последней цене деталей, которые были поставлены для указанного изделия.
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" Height="131px" Width="555px">
        </asp:GridView>
        <br />
        Укажите изделие:<asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="n_izd">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:studentsConnectionString %>" ProviderName="<%$ ConnectionStrings:studentsConnectionString.ProviderName %>" SelectCommand="SELECT n_izd, name FROM pmib8502.j"></asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Выберите изделие!" BackColor="#FF3300"></asp:RequiredFieldValidator>
        <p>
            <asp:Button ID="Button1" runat="server" Height="68px" OnClick="Button1_Click" Text="Выполнить запрос" Width="160px" />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#009933"></asp:Label>
        </p>
    </form>
</body>
</html>
