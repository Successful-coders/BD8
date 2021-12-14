<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="BD_BR5.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" aria-orientation="vertical" style="border-style: groove; font-style: normal; font-size: medium; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; background-color: #FFFFFF; background-position: center">
        <div style="height: 68px">
            8 лабораторная работа. Выполнили: Воронкина Дарья, Кондратьев Игорь.<br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm1.aspx">Перейти к 1 запросу</asp:HyperLink>
            <br />
            Вставить заказ с указанными параметрами.&nbsp;&nbsp;&nbsp; </div>
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
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="Выберите изделие!" BackColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        <br />
        Укажите клиента<asp:RadioButtonList ID="RadioButtonList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="name" DataValueField="n_cl">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:studentsConnectionString4 %>" ProviderName="<%$ ConnectionStrings:studentsConnectionString4.ProviderName %>" SelectCommand="SELECT n_cl, name from pmib8502.c
"></asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList3" ErrorMessage="Выберите клиента!" BackColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        <br />
        Укажите дату заказа:<br />
        <asp:TextBox ID="TextBox1" runat="server" Height="27px" TextMode="Date" Width="159px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="Укажите дату заказа!" BackColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        Укажите дату оплаты:<br />
        <asp:TextBox ID="TextBox2" runat="server" Height="27px" TextMode="Date" Width="159px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="Укажите дату оплаты!" BackColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        Укажите дату доставки:<br />
        <asp:TextBox ID="TextBox3" runat="server" Height="27px" TextMode="Date" Width="159px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="Укажите дату доставки!" BackColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        Укажите количество:<br />
        <asp:TextBox ID="TextBox4" runat="server" Height="27px" TextMode="Number" Width="159px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox4" ErrorMessage="Укажите количество!" BackColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        Укажите цену:<br />
        <asp:TextBox ID="TextBox5" runat="server" Height="27px" TextMode="Number" Width="159px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox5" ErrorMessage="Укажите цену!" BackColor="#FF3300" BorderColor="#FF5050"></asp:RequiredFieldValidator>
        <br />
        <p>
            <asp:Button ID="Button2" runat="server" Height="68px" OnClick="Button1_Click" Text="Выполнить запрос" Width="160px" />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Berlin Sans FB Demi" Font-Size="Large" ForeColor="#009933"></asp:Label>
        </p>
    </form>
</body>
</html>
