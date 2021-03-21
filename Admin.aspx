<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
                AutoGenerateColumns="False" ID="Matchdetail" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="EmpName" HeaderText="Name" ItemStyle-Width="150" />
                    <asp:BoundField DataField="EmpContact" HeaderText="Contact Number" ItemStyle-Width="150" />
                    <asp:BoundField DataField="EmpEmail" HeaderText="Email" ItemStyle-Width="150" />
                    <asp:BoundField DataField="EmpNumber" HeaderText="Number" ItemStyle-Width="150" />
                    <asp:TemplateField HeaderText="Image">

                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Width="150" Height="100" ImageUrl='<%#Eval("EmpAdharImgPath")%>' />

                        </ItemTemplate>

                        
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Image">

                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" Width="150" Height="100" ImageUrl='<%#Eval("EmpPANImgPath")%>' />

                        </ItemTemplate>

                        
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

            <asp:Button ID="btnexcel" runat="server" Text="Download PDF" CssClass="mybuttons" OnClick="btnexcel_Click" />
        </div>
    </form>
</body>
</html>
