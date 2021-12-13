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
            Получить информацию о последней цене деталей, которые были поставлены для указанного изделия.
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" Height="131px" Width="555px">
        </asp:GridView>
        <br />
        Укажите изделие:<asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="n_izd">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:studentsConnectionString %>" ProviderName="<%$ ConnectionStrings:studentsConnectionString.ProviderName %>" SelectCommand="SELECT n_izd, name FROM pmib8502.j"></asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Выберите изделие!"></asp:RequiredFieldValidator>
        <p>
            <asp:Button ID="Button1" runat="server" Height="68px" OnClick="Button1_Click" Text="Выполнить запрос" Width="160px" />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <div style="height: 26px">
            Вставить заказ с указанными параметрами.<br />
        </div>
        Номер заказа:<br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="n" DataValueField="n" Height="35px" Width="166px">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:studentsConnectionString3 %>" ProviderName="<%$ ConnectionStrings:studentsConnectionString3.ProviderName %>" SelectCommand="select CONCAT('R',count(n_real)+1) as n 
from pmib8502.r"></asp:SqlDataSource>
        <br />
        Укажите изделие:<asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="n_izd">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:studentsConnectionString %>" ProviderName="<%$ ConnectionStrings:studentsConnectionString.ProviderName %>" SelectCommand="SELECT n_izd, name FROM pmib8502.j"></asp:SqlDataSource>
        <br />
        Укажите клиента<br />
        <asp:RadioButtonList ID="RadioButtonList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="name" DataValueField="n_cl">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:studentsConnectionString4 %>" ProviderName="<%$ ConnectionStrings:studentsConnectionString4.ProviderName %>" SelectCommand="SELECT n_cl, name from pmib8502.c
"></asp:SqlDataSource>
        <br />
        Укажите дату заказа:<br />
        <asp:TextBox ID="TextBox1" runat="server" Height="27px" TextMode="Date" Width="159px"></asp:TextBox>
        <br />
        Укажите дату оплаты:<br />
        <asp:TextBox ID="TextBox2" runat="server" Height="27px" TextMode="Date" Width="159px"></asp:TextBox>
        <br />
        Укажите дату доставки:<br />
        <asp:TextBox ID="TextBox3" runat="server" Height="27px" TextMode="Date" Width="159px"></asp:TextBox>
        <br />
        Укажите количество:<br />
        <asp:TextBox ID="TextBox4" runat="server" Height="27px" TextMode="Number" Width="159px"></asp:TextBox>
        <br />
        Укажите цену:<br />
        <asp:TextBox ID="TextBox5" runat="server" Height="27px" TextMode="Number" Width="159px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="Выберите изделие!"></asp:RequiredFieldValidator>
        <p>
            <asp:Button ID="Button2" runat="server" Height="68px" OnClick="Button1_Click" Text="Выполнить запрос" Width="160px" />
        </p>
    </form>
</body>
</html>
